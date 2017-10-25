library("openxlsx")
library("TDA")

CorE = commandArgs(trailingOnly=TRUE)[1] #第一引数取得　0:csv 1:xlsx
index_name = commandArgs(trailingOnly=TRUE)[2] #第二引数取得　0:行名なし 1:行名あり
column_name = commandArgs(trailingOnly=TRUE)[2] #第三引数取得　0:列名なし 1:列名あり


############ データ読み込み #######################################

if(index_name == 0) {

  if(column_name == 0) {
    
    if(CorE == 0) {
      #行名なし　列名なし　csv
      data <- read.csv("../get_data/get_data.csv", header = F)
    } else if(CorE == 1) {
      #行名なし　列名なし　xlsx
      data <- read.xlsx("../get_data/get_data.xlsx", sheet = 1, check.names = F, rowNames = F)
    }
    
  } else if (column_name == 1) {
    
    if(CorE == 0) {
      #行名なし　列名あり　csv
      data <- read.csv("../get_data/get_data.csv", header = T)
    } else if(CorE == 1) {
      #行名なし　列名あり　xlsx
      data <- read.xlsx("../get_data/get_data.xlsx", sheet = 1, check.names = T, rowNames = F)
    }
  }
    
} else if(index_name == 1) {
    
    if(column_name == 0) {
      
      if(CorE == 0) {
        #行名あり　列名なし　csv
        data <- read.csv("../get_data/get_data.csv", header = F, row.names = 1)
      } else if(CorE == 1) {
        #行名あり　列名なし　xlsx
        data <- read.xlsx("../get_data/get_data.xlsx", sheet = 1, check.names = F, rowNames = T)
      }
      
    } else if (column_name == 1) {
      
      if(CorE == 0) {
        #行名あり　列名あり　csv
        data <- read.csv("../get_data/get_data.csv", header = T, row.names = 1)
      } else if(CorE == 1) {
        #行名あり　列名あり　xlsx
        data <- read.xlsx("../get_data/get_data.xlsx", sheet = 1, check.names = T, rowNames = T)
      }
    }
}

############ 可視化 #######################################

if(length(data) == 1){
  
  #1次元データの場合：x軸はデータの個数+α, y軸にデータ
  x <- 1:nrow(data[1])
  y <- c(data[1])
  plot(x, y[[1]], xlim=c(0, (nrow(data[1])+1)), ylim=c((min(data[1])-1), (max(data[1])+1)),
                              xlab = "X", ylab = "Y = input data")
  
} else if(length(data) == 2) {
  
  #2次元データの場合：x軸は1列目のデータ, y軸は2列目のデータ
  #見やすいようにデータの最小、最大から±1しておく
  
  #元データのデータ点
  plot(data, xlim=c((min(data[1])-1), (max(data[1])+1)), ylim=c((min(data[2])-1), (max(data[2])+1)),
       xlab = "X = input data(:, 1)", ylab = "Y = input data(:, 2)", pch=20)
  
  #重ね合わせてplot
  par(new = T)
  
  #データ点を膨らませた場合
  plot(data, xlim=c((min(data[1])-1), (max(data[1])+1)), ylim=c((min(data[2])-1), (max(data[2])+1)),
                      xlab = "X = input data(:, 1)", ylab = "Y = input data(:, 2)",
                      col=NULL, bg=rgb(0, 0, 1, alpha=0.3), pch=21, cex=14)
  
}
  
data <- as.matrix(data)
tda <- ripsDiag(X = data, maxdimension = 1, maxscale = 3)

png("../get_data/barcode.png")
plot(tda[["diagram"]], barcode = TRUE)
dev.off()

