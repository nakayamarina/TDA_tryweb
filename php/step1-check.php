<?php

#アップロードされたファイル
$tempfile = $_FILES['fname']['tmp_name'];

#アップロードされたファイルの名前
$fname = $_FILES['fname']['name'];

#アップロードされたファイルの拡張子取得
$ext = pathinfo($fname, PATHINFO_EXTENSION);

#保存先とファイル名の作成（ファイル名get_dataに上記で取得した拡張子をつける）
$filename = '../get_data/get_data.' . $ext;


if (is_uploaded_file($tempfile)) {
    #move_uploaded_fileでアップロードされたファイルに保存先と名前を設定して移動
    if ( move_uploaded_file($tempfile , $filename )) {
      $result = "ファイルをアップロードしました。";
    } else {
      $result =  "ファイルをアップロードできません。";
    }
} else {
    $result =  "ファイルが選択されていません。";
}

#最後に書く
require('../html/step1-check.html')
?>
