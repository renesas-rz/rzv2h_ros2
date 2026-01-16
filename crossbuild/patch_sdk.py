import glob
import os
import sys

# sysrootパスを指定
sdk_path="/opt/rz-vlp/5.0.11/sysroots/cortexa55-poky-linux"

# 検索対象のパスを指定（== sysrootパス）
tgt_path=sdk_path
#tgt_path="dbg"

# 検索キーワード1 （固定値。変更しない事）
keyword="INTERFACE_LINK_LIBRARIES"

# 検索キーワード2　SDKのビルドパスを指定
# （フルパスでなくても可。一意に特定できる範囲で）
keyword2="/home/umemoto/yocto/rzv2h/AISDK_v6/build"

#############################
# 対象ファイル検索
#############################
def search_target():
  tgt_files = []
  #for file_name in glob.glob(tgt_path + "/**/*Export.cmake", recursive=True):
  for file_name in glob.glob(tgt_path + "/**/*.cmake", recursive=True):
    flg = 0
    try:
      file = open(file_name)
      lines = file.readlines()
      for line in lines:
        if (keyword in line):
          if (keyword2 in line):
            flg = 1

    except Exception as e:
      print(e)
    finally:
      file.close()

    if flg == 1:
      tgt_files.append(file_name)

  return tgt_files

#############################
# 対象ファイルを元にshadowファイルを作成
#############################
def update_target(file_name, shadow):
  sw_name = shadow
  wfile = open(sw_name, 'w')
  try:
    file = open(file_name)
    lines = file.readlines()
    line_idx = 1
    for line in lines:
      line_idx = line_idx + 1
      flg = 0
      k1 = keyword in line
      k2 = keyword2 in line
      if (k1 and k2):
        line = line.strip()
        words = line.split(" ")
        widx = 0
        for word in words:
          word = word.strip()
          word = word.strip('"')
          #print("word:",widx, "[" + word + "]")
          widx = widx + 1
          newwords = []
          if (keyword2 in word):
            tokens = word.split(";")
            tidx = 0
            newtokens = []
            for token in tokens:
              #print("token:",tidx, "[" + token + "]")
              tidx = tidx + 1
              if (keyword2 in token):
                bn = os.path.basename(token)
                dn = os.path.dirname(token)

                d1 = os.path.basename(dn)
                dn1 = os.path.dirname(dn)
                d2 = os.path.basename(dn1)

                token = sdk_path + "/" + d2+ "/" + d1 + "/" + bn
              newtokens.append(token)
            word = ""
            index = 0
            for nw in newtokens:
              if index != 0:
                word = word + ";" + nw
              else:
                word = nw
              index = index + 1
            word = '"' + word + '"'
            #print(word)
          #newwords.append(word)
        print("  INTERFACE_LINK_LIBRARIES " + word, file=wfile)
        #print("  INTERFACE_LINK_LIBRARIES " + word)
        
      else:
        print(line, file=wfile, end="")

  except Exception as e:
    print(e)
  finally:
    file.close()
  wfile.close()

#############################
# shadowファイルを対象ファイルと入れ替える
#############################
def swap_file(file_name, shadow):
  bkup = file_name + ".backup"
  os.rename(file_name, bkup)
  os.rename(shadow, file_name)

target = search_target()
for file_name in target:
  print("target["+file_name+"]")
  shadow = file_name + ".shadow"
  update_target(file_name, shadow)
  swap_file(file_name, shadow)
