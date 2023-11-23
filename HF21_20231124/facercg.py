import cv2
import numpy as np


#logファイル最後行読み取り
with open("C:/java_workspase/HF21/log/2023_11.log", "r" ,encoding="utf-8") as f:
    for line in f:
        pass
    last_line = line

for num in range(3):
    target = ':'
    idx = last_line.find(target)
    last_line = last_line[idx+1:]

last_line = last_line[:-1]
path = "C:/java_workspase/HF21/image/"+last_line

print(path)
#画像の読み込み
img = cv2.imread(path)
if img is not None:
    # 画像の読み込みに成功した場合の処理
    dst = img.copy()
else:
    # 画像の読み込みに失敗した場合のエラーハンドリング
    print("画像の読み込みに失敗しました。")

#モザイク関数
def mosaic(img, ratio=0.1):
    small = cv2.resize(img, None, fx=ratio, fy=ratio, interpolation=cv2.INTER_NEAREST)
    return cv2.resize(small, img.shape[:2][::-1], interpolation=cv2.INTER_NEAREST)


def mosaic_area(img, x, y, width, height, ratio=0.1):
    dst = img.copy()
    dst[y:y + height, x:x + width] = mosaic(dst[y:y + height, x:x + width], ratio)
    return dst

dst_area = mosaic_area(img, 100, 50, 100, 150)

#画像からノイズ除去し誤認識を少なくするためグレースケール化
img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY) #imgをcv2クラスを使用してBGRからグレー化

# 学習済みモデルの読み込み
cascade = cv2.CascadeClassifier("C:/Users/desti/AppData/Local/Programs/Python/Python311/Lib/site-packages/cv2/data/haarcascade_frontalface_default.xml")

# 顔を検出する
lists = cascade.detectMultiScale(img_gray, minSize=(100, 100))

filepath = 'C:/java_workspase/HF21/image/mosaic/' + last_line

if len(lists):
    #input("ifの中:")
    #顔を検出した場合、forですべての顔を赤い長方形で囲む
    for (x,y,w,h) in lists:
        #rectangleメソッドを使用し赤い長方形で検出した顔を囲むようにしている
        dst_face = mosaic_area(img, x, y, w, h)
        #画像表示cv2.imshow('img',dst_face)
        cv2.waitKey(0)
        cv2.imshow('dst_face',dst_face)
        cv2.imwrite(filepath, dst_face)
else:
 input("elseの中:")
 print('Nothing')#顔検出がない場合Nothingを表示