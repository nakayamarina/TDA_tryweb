<?php

################ number の値受け取り ###################

$notch = $_POST['notch'];
$pngs = $_POST['pngs'];

################ R program 実行 ######################

#Rscript tda_image.r -> TDA適用時のイメージ画像、バーコード出力
#tda_image.pyも作成したがtda_image.rの方が早いのでボツ

$r_ex = "/usr/local/bin/Rscript ../R_Python_sh/tda_image.r $notch $pngs";
$output = shell_exec("{$r_ex} 2>&1");
//print_r($output);


################ 画像出力 ############################

#tda_image.rで得られた画像を全てスライドショーに加える

#データ点の直径
$dm = $notch;

#../get_dataに保存されたtdaから始まる画像ファイルのパスを全て取得
foreach(glob('../get_data/tda*',GLOB_BRACE) as $file){
    if(is_file($file)){

      //キャプション用
      $title = "Diameter:$dm";

      #<li><img src="ファイルパス"></li>で画像を出力
      #全てのファイルの<li><img src="ファイルパス"></li>を.=で結合
      $output .= "<li><img src=$file title=$title></li>";

      $dm = $dm + $notch;
    }
}

#最後に書く
require('../html/step3.html');

?>
