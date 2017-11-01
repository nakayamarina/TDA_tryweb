import sys
import pandas as pd
import matplotlib.pyplot as plt

######### データ読み込みおよび整形 #######################################

#引数取得
args = sys.argv

#行名なし(0) or あり(1)
row_name = int(args[1])

#列名なし(0) or あり(1)
column_name = int(args[2])

xlsx_file = '../get_data/get_data.xlsx'

if column_name == 0:

    if row_name == 0:

        #行名なし　列名なし　xlsx
        data = pd.ExcelFile(xlsx_file)
        #シート番号取得
        sheets = data.sheet_names
        #最初のシートをデータフレーム化
        data = data.parse(sheets[0], index_col = None, header = None)
        data = data.dropna()

    elif row_name == 1:

        #行名あり　列名なし　xlsx
        data = pd.ExcelFile(xlsx_file)
        #シート番号取得
        sheets = data.sheet_names
        #最初のシートをデータフレーム化
        data = data.parse(sheets[0], index_col = 0, header = None)
        data = data.dropna()

elif column_name == 1:

    if row_name == 0:

        #行名なし　列名あり　xlsx
        data = pd.ExcelFile(xlsx_file)
        #シート番号取得
        sheets = data.sheet_names
        #最初のシートをデータフレーム化
        data = data.parse(sheets[0], index_col = None, header = 0)
        data = data.dropna()

    elif row_name == 1:

        #行名あり　列名あり　xlsx
        data = pd.ExcelFile(xlsx_file)
        #シート番号取得
        sheets = data.sheet_names
        #最初のシートをデータフレーム化
        data = data.parse(sheets[0], index_col = 0, header = 0)
        data = data.dropna()

#列名をつける

#1次元データの場合
if data.shape[1] == 1:
    data.columns = ['X']

#2次元データの場合
elif data.shape[1] == 2:
    data.columns = ['X', 'Y']

#整形データをcsvで出力
data.to_csv('../get_data/pre_data.csv', index = False)


######### データの可視化 #######################################

#2次元データの場合
if data.shape[1] == 2:

    #X軸 : dataの1列目
    #Y軸 : dataの2列目
    plt.scatter(data.X, data.Y, c = "black")

    #ラベルと目盛りの設定
    plt.xlim(min(data.X)-2, max(data.X) + 2)
    plt.ylim(min(data.Y)-2, max(data.Y) + 2)
    plt.xlabel('X : Input Data 1st column')
    plt.ylabel('Y : Input Data 2nd column')

    #保存
    plt.savefig('../get_data/user_data.png')

#1次元データの場合
elif data.shape[1] == 1:

    #X軸 : dataの個数(行数)
    x = range(0,len(data))

    #Y軸 : data
    plt.scatter(x, data.X, c = "black")

    #ラベルと目盛りの設定
    plt.xlim(-2, len(data) + 2)
    plt.ylim(min(data.X)-2, max(data.X)+2)
    plt.xlabel('X : Number of Input Data')
    plt.ylabel('Y : Input Data')

    #保存
    plt.savefig('../get_data/user_data.png')
