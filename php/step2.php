<?php

#error表示
ini_set('display_errors', 1);
################ チェックボックス値受け取り #############

$row_names = $_POST['row_names'];
$column_names = $_POST['column_names'];

################ ファイルアップロード ##################

#アップロードされたファイル
$tempfile = $_FILES['fname']['tmp_name'];

#アップロードされたファイルの名前
$fname = $_FILES['fname']['name'];

#アップロードされたファイルの拡張子取得
$ext = pathinfo($fname, PATHINFO_EXTENSION);

#csvであれば0, xlsxであれば1を格納
if(strpos($ext, 'csv') !== false){
  $file_type = 0;
} else if(strpos($ext, 'xlsx') !== false){
  $file_type = 1;
} else {
  $file_type = 2;
}

#保存先とファイル名の作成（ファイル名get_dataに上記で取得した拡張子をつける）
$filename = '../get_data/get_data.' . $ext;


if (is_uploaded_file($tempfile)) {
    #move_uploaded_fileでアップロードされたファイルに保存先と名前を設定して移動
    if ( move_uploaded_file($tempfile , $filename )) {
      $result = "データは以下のように分布しています。";
    } else {
      $result =  "ファイルをアップロードできません。";
    }
} else if ($file_type == 2){
  $result = "csv形式かxlsx形式のファイルを選択してください。";
}

################ R program 実行 ######################

#Rscript：data_handling.r実行 -> データの前処理と可視化

#パスが追加されていないためRscriptのパスを記述する必要がある
#$Rex = "/usr/local/bin/Rscript ../tda/data_handling.r $file_type $row_names $column_names";
$Rex = "/bin/sh ./step2.sh $file_type $row_names $column_names";

$output = shell_exec("{$Rex} 2>&1");
print_r($output);


#最後に書く
require('../html/step2.html')

?>
