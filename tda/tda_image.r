library("openxlsx")
library("TDA")

notch = as.numeric(commandArgs(trailingOnly=TRUE)[1]) #第一引数取得　データ点の変化率
pngs = as.numeric(commandArgs(trailingOnly=TRUE)[2]) #第二引数取得　データ点を変化させる回数（TDA適用イメージ出力枚数）

data <- read.csv("../get_data/pre_data.csv", header = FALSE)


############ 可視化 #######################################

#データ点のサイズ
circle_size <- 1 + notch
#出力枚数
count <- 1

if(length(data) == 1){

  #1次元データの場合：x軸はデータの個数+α, y軸にデータ

  #x,y軸をそれぞれ設定
  x <- 1:nrow(data[1])
  y <- c(data[1])

  #TDA適用イメージを出力
  while(count <= pngs){

    png_name <- paste("../get_data/tda-" , count, ".png", sep="")
    png(png_name)
    #元データのデータ点
    plot(x, y[[1]], xlim=c(0, (nrow(data[1])+1)), ylim=c((min(data[1])-1), (max(data[1])+1)),
         xlab = "X", ylab = "Y = input data", pch=20)

    #重ね合わせてplot
    par(new = T)

    #データ点を膨らませた場合
    #cexで点の大きさ調整
    plot(x, y[[1]], xlim=c(0, (nrow(data[1])+1)), ylim=c((min(data[1])-1), (max(data[1])+1)),
         xlab = "X", ylab = "Y = input data",
         col=NULL, bg=rgb(0, 0, 1, alpha=0.3), pch=21, cex=circle_size)

    dev.off()

    circle_size <- circle_size + notch
    count <- count + 1
  }

} else if(length(data) == 2) {

    #TDA適用イメージを出力
    while(count <= pngs){

      png_name <- paste("../get_data/tda-" , count, ".png", sep="")
      png(png_name)
      #元データのデータ点
      plot(data, xlim=c((min(data[1])-2), (max(data[1])+2)), ylim=c((min(data[2])-2), (max(data[2])+2)),
           xlab = "X = input data(:, 1)", ylab = "Y = input data(:, 2)", pch=20)

      #重ね合わせてplot
      par(new = T)

      #データ点を膨らませた場合
      #cexで点の大きさ調整
      plot(data, xlim=c((min(data[1])-2), (max(data[1])+2)), ylim=c((min(data[2])-2), (max(data[2])+2)),
                          xlab = "X = input data(:, 1)", ylab = "Y = input data(:, 2)",
                          col=NULL, bg=rgb(0, 0, 1, alpha=0.3), pch=21, cex=circle_size)

      dev.off()

      circle_size <- circle_size + notch
      count <- count + 1
    }

}

############ TDA適用 -> バーコード出力 ####################################

data <- as.matrix(data)
tda <- ripsDiag(X = data, maxdimension = 1, maxscale = 3)

png("../get_data/barcode.png")
plot(tda[["diagram"]], barcode = TRUE)
dev.off()
