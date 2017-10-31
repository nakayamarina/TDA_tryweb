<?php

#resultのbarcode.pngを削除してstep1に戻る

$sh_ex = "/bin/sh ../R_Python_sh/remove_result.sh";
$output = shell_exec("{$sh_ex} 2>&1");
//print_r($output);

#最後に書く
require('../html/step1.html')

?>
