library("openxlsx")
library("TDA")

CorE = as.numeric(commandArgs(trailingOnly=TRUE)[1]) #第一引数取得　0:csv 1:xlsx
row_name = as.numeric(commandArgs(trailingOnly=TRUE)[2]) #第二引数取得　0:行名なし 1:行名あり
column_name = as.numeric(commandArgs(trailingOnly=TRUE)[3]) #第三引数取得　0:列名なし 1:列名あり

############ データ読み込み #######################################
data <- read.table("../get_data/get_data.csv", sep = ",")
names(data) <- NULL

print(length(data))

if((row_name == 0) && (column_name == 0) && (CorE == 1)){
  #行名なし　列名なし　xlsx
  data <- read.xlsx("../get_data/get_data.xlsx", sheet = 1, rowNames = F, colNames = F)
  names(data) <- NULL
  print(1)
} else if((row_name == 0) && (column_name == 1) && (CorE == 0)){
  #行名なし　列名あり　csv
  data <- read.csv("../get_data/get_data.csv", sep = ",", header = T)
  names(data) <- NULL
  print(2)
} else if((row_name == 0) && (column_name == 1) && (CorE == 1)){
  #行名なし　列名あり　xlsx
  data <- read.xlsx("../get_data/get_data.xlsx", sheet = 1, rowNames = F, colNames = T)
  names(data) <- NULL
  print(3)
} else if((row_name == 1) && (column_name == 0) && (CorE == 0)){
  #行名あり　列名なし　csv
  data <- read.csv("../get_data/get_data.csv", sep = ",", header = F, row.names = 1)
  names(data) <- NULL
  print(4)
} else if((row_name == 1) && (column_name == 0) && (CorE == 1)){
  #行名あり　列名なし　xlsx
  data <- read.xlsx("../get_data/get_data.xlsx", sheet = 1, rowNames = T, colNames = F)
  names(data) <- NULL
  print(5)
} else if((row_name == 1) && (column_name == 1) && (CorE == 0)){
  #行名あり　列名あり　csv
  data <- read.csv("../get_data/get_data.csv", sep = ",", header = T, row.names = 1)
  names(data) <- NULL
  print(6)
} else if((row_name == 1) && (column_name == 1) && (CorE == 1)){
  #行名あり　列名あり　xlsx
  data <- read.xlsx("../get_data/get_data.xlsx", sheet = 1, rowNames = T, colNames = T)
  names(data) <- NULL
  print(7)
}


write.csv(data, "../get_data/pre_data.csv", quote = F, row.names = F)


############ 可視化 #######################################

#出力枚数
count <- 1
if(length(data) == 1){

  #1次元データの場合：x軸はデータの個数+α, y軸にデータ

  #x,y軸をそれぞれ設定
  x <- 1:nrow(data[1])
  y <- c(data[1])

  #アップロードされたデータの可視化
  png("../get_data/user_data.png")
  plot(x, y[[1]], xlim=c(0, (nrow(data[1])+1)), ylim=c((min(data[1])-1), (max(data[1])+1)),
                              xlab = "X", ylab = "Y = input data")
  dev.off()

} else if(length(data) == 2) {

  #2次元データの場合：x軸は1列目のデータ, y軸は2列目のデータ
  #見やすいようにデータの最小、最大から±2しておく

  #アップロードされたデータの可視化
  png("../get_data/user_data.png")
  plot(data, xlim=c((min(data[1])-2), (max(data[1])+2)), ylim=c((min(data[2])-2), (max(data[2])+2)),
       xlab = "X = input data(:, 1)", ylab = "Y = input data(:, 2)", pch=20)
  dev.off()

}
