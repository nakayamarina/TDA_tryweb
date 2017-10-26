<?php

$notch = $_POST['notch'];
$pngs = $_POST['pngs'];

$Rex = "/usr/local/bin/Rscript ../tda/tda_image.r $notch $pngs";
shell_exec($Rex);

#最後に書く
require('../html/step3.html');

?>
