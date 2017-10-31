<?php

#get_dataディレクトリの出力データを全て削除

$sh_ex = "/bin/sh ../R_Python_sh/remove_get_data.sh";
$output = shell_exec("{$sh_ex} 2>&1");
//print_r($output);

#最後に書く
require('../html/step4.html')

?>
