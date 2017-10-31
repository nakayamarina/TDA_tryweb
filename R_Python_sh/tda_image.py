#tda_image.rと同じ処理だが処理が遅い
#1次元データのの処理は未記述

import sys
import pandas as pd
import matplotlib.pyplot as plt

#引数取得
args = sys.argv

#データ点の変化率
#0.1cm -> 64(pltで設定するデータ点の大きさ)
notch = float(args[1])
notch = notch * 10 * 64

#データ点を変化させる回数(TDA適用イメージpng出力枚数)
pngs = int(args[2])

#データ読み込み
data = pd.read_csv('../get_data/pre_data.csv')

######### TDA適用イメージ作成 #####################

#データ点のサイズ
circle_size = notch

#出力回数
count = 1

#1次元データの場合
#if data.shape[1] == 1:


#2次元データの場合
#elif data.shape[1] == 2:

while count <= pngs:

    png_name = '../get_data/tda-' + str(count) + '.png'

    #元のデータ点
    plt.scatter(data.X, data.Y, s = notch, c = "black")

    #データ点を膨らませた場合
    plt.scatter(data.X, data.Y, s = circle_size, c = "blue", alpha = 0.2)

    plt.xlim(min(data.X)-2, max(data.X) + 2)
    plt.ylim(min(data.Y)-2, max(data.Y) + 2)
    plt.xlabel('X : Input Data 1st column')
    plt.ylabel('Y : Input Data 2nd column')

    plt.savefig(png_name)

    #リセット
    plt.figure()

    circle_size = circle_size + notch
    count = count + 1
