<?php

#resultディレクトリにtdaイメージの出力をし直すため
#resultディレクトリのtdaのpngのみ削除

$sh_ex = "/bin/sh ../R_Python_sh/remove_tda.sh";
$output = shell_exec("{$sh_ex} 2>&1");
//print_r($output);

#最後に書く
require('../html/step2.html')

?>
