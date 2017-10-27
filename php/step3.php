<?php

################ number の値受け取り ###################

$notch = $_POST['notch'];
$pngs = $_POST['pngs'];

################ R program 実行 ######################

#Rscript tda_image.r -> TDA適用時のイメージ画像、バーコード出力
#tda_image.pyも作成したがtda_image.rの方が早いのでボツ

$r_ex = "/usr/local/bin/Rscript ../R_Python/tda_image.r $notch $pngs";

$output = shell_exec("{$r_ex} 2>&1");
//print_r($output);

#最後に書く
require('../html/step3.html');

?>
