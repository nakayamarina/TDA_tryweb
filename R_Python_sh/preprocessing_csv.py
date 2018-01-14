import sys
import pandas as pd
import matplotlib.pyplot as plt

##### データ読み込み ###############################################

def read_data(row_name, column_name):

    # 読み込むcsvファイル名
    csv_file = '../get_data/get_data.csv'

    # 行名なし
    if row_name == 0:
        idx = None

    # 行名あり
    else:
        idx = 0

    # 列名なし
    if column_name == 0:
        hdr = None

    # 列名あり
    else:
        hdr = 0

    # データ読み込み
    data = pd.read_csv(csv_file, index_col = idx, header = hdr)
    # 欠損値削除
    data = data.dropna()

    return(data)


if __name__ == '__main__':

    #引数取得
    args = sys.argv

    #行名なし(0) or あり(1)
    row_name = int(args[1])

    #列名なし(0) or あり(1)
    column_name = int(args[2])

    data = read_data(row_name, column_name)


    ######### データの書き出し・可視化 ###############################

    #2次元データの場合
    if data.shape[1] == 2:

        # 列名をつける
        data.columns = ['X', 'Y']

        # 整形データをcsvで出力
        data.to_csv('../get_data/pre_data.csv', index = False)

        #X軸 : dataの1列目
        #Y軸 : dataの2列目
        plt.scatter(data.X, data.Y, c = "black")

        #ラベルと目盛りの設定
        plt.xlim(min(data.X)-2, max(data.X) + 2)
        plt.ylim(min(data.Y)-2, max(data.Y) + 2)
        plt.xlabel('X : Input Data 1st column')
        plt.ylabel('Y : Input Data 2nd column')

        #可視化したものを保存
        plt.savefig('../get_data/user_data.png')

    elif data.shape[1] == 1:

        # 列名をつける
        data.columns = ['X']

        # 整形データをcsvで出力
        data.to_csv('../get_data/pre_data.csv', index = False)

        #X軸 : dataの個数(行数)
        x = range(0,len(data))

        #Y軸 : data
        plt.scatter(x, data.X, c = "black")

        #ラベルと目盛りの設定
        plt.xlim(-2, len(data) + 2)
        plt.ylim(min(data.X)-2, max(data.X)+2)
        plt.xlabel('X : Number of Input Data')
        plt.ylabel('Y : Input Data')

        #可視化したものを保存
        plt.savefig('../get_data/user_data.png')
