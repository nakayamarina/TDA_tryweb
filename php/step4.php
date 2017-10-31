<?php

#Rscript tda_image.r -> TDA適用時のイメージ画像、バーコード出力
#tda_image.pyも作成したがtda_image.rの方が早いのでボツ

$sh_ex = "/bin/sh ../R_Python_sh/remove.sh";
$output = shell_exec("{$sh_ex} 2>&1");
//print_r($output);

#最後に書く
require('../html/step4.html')

?>
