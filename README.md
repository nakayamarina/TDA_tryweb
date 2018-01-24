トポロジカルデータ分析説明サイト
=======

## はじめに
トポロジカルデータ分析をイメージしてもらいやすくするため，またデータ分析をシステムとして実装する勉強も兼ねて，ユーザの入力データに対してトポロジカルデータ分析を行い，仕組みや結果を可視化するサイトを作成中．

**Topological Data Analysis (TDA) とは**  
位相幾何学を利用しデータの分布の形状に着目する新しいデータ分析手法．

位相幾何学（Topology）とは，角度や距離などの様々な性質が失われたも残る性質をみるものである．  
位相幾何学では，図形を連続的に変化（切り貼りなしの変形）が許され，それでも残る性質を「位相不変量」という．位相不変量には幾つかの種類があるが，そのうちの一つに「穴」がある．穴に着目すれば，ドーナツと取っ手のついたコーヒーカップは同じ性質と捉えることができる．これは，コーヒーカップを変形すればドーナツのような形にすることができるためである．  
位相幾何学における穴には下図に示すように，データ点そのものを意味する0次の穴，一般的な穴のイメージである1次の穴，空洞を意味する2次の穴というように種類がある．  
<div align="center">
<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/etc/img/holes.png" alt="holes" title="holes" width="400" height="150">
</div>

これらの穴に着目してデータ分布の形状を捉えるのが，TDAのPersistent Homologyである．Persistent Homologyはデータ点の直径の変化に伴う穴の発生と消滅情報をみることでデータ全体の形を捉えるものである．  
データというのは特徴空間において点の集合であるため，どのようなものを穴と捉えるかという問題がある．そこでPersistent Homologyでは，データの点をボール状に膨らませることで，連結した図形の穴に着目する．穴の形状により穴の発生と消滅のタイミングは異なるため，データ点の分布の形状の特性を捉えることが可能となる．そして，データ点の直径の変化に伴う穴の発生と消滅の情報を可視化する技術にバーコードがある（下図）．  
<div align="center">
<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/etc/readme/hole.png" alt="ph" title="ph" width="400" height="100" align = "center">  


<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/etc/readme/pd.png" alt="ph" title="ph" width="300" height="180" align = "center">
</div>

## 動作環境
* MAMP
* Python 3.6.1(Anaconda 4.4.0)
* R 3.3.2
  - TDA
* PHP 7.1.8

## DEMO

<div align="center">
<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/etc/readme/demo.gif" alt="holes" title="holes" width="700" height="500">
</div>

## 構成

<div align="center">
<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/etc/readme/tda_tryweb.png" alt="holes" title="holes" width="500" height="300">
</div>

### 構成図

### トップページ
#### Topological Data Analysis
* /html/top.html

背景は[particles.js](https://liginc.co.jp/191958)に手を加えたものを使用．
* /css/top.css
* /js/jquery.min.js
* /js/particles.js
* /js/cover.js  

上記のコードはすべてのページで使用しているため，以下は記述を省略．

### 説明
#### WHAT1
TDAの説明
* /html/what_tda.html
* /css/main.css

### WHAT2
Persistent Homologyの説明
* /html/what_ph.html
* /css/main.css
* /img/ (説明用画像)

### TDA体験
#### STEP.1
ユーザの選択したデータファイルを読み込み
* /html/step1.html
* /css/main.css
* /php/step2.php
  - 行名の有無 --> なし:0, あり:1
  - 列名の有無 --> なし:0, あり:1
  - ユーザの選択したデータファイルの拡張子を調べる  
  --> csv : /R_Python_sh/preprocessing_csv.pyを行列名の有無を引数で渡して実行  
  --> xlsx : /R_Python_sh/preprocessing_xlsx.pyを行列名の有無を引数で渡して実行

ユーザの選択したデータファイルの前処理（欠損値除去，行列名の削除），前処理済みのデータを/get_data/pre_data.csvとして書き出し，グラフを/get_data/user_data.pngとして書き出し．
* /R_Python_sh/preprocessing_csv.py
* /R_Python_sh/preprocessing_xlsx.py

#### STEP.2
トポロジカルデータを適用する際のパラメータを設定．  
TDA適用にはRのパッケージTDAを使用する．

* /html/step2.html --> step2.phpで書き出した/get_data/user_data.png表示
* /css/main.css
* /php/step3.php
  - TDA適用イメージ可視化のためデータ点をどれぐらいずつ大きくしていくか設定 --> notch
  - TDA適用イメージ可視化のためデータ点を何回大きくするか設定(画像出力枚数) --> pngs
  - notchとpngsを引数で渡して/R_Python_sh/tda_image.rを実行

/get_data/pre_data.csvと，notch・pngsをもとにTDA適用イメージを/get_data/にpngs分書き出し，TDAを適用，バーコードを/result/barcode.pngとして書き出し．
* /R_Python_sh/tda_image.r

#### STEP.3
TDA適用イメージを表示
* /html/step3.html --> step2.phpで/get_data/に書き出したTDA適用イメージをpngs分表示
* /css/main.css
* /php/return_step2.php
  - /R_Python_sh/remove_tda.shを実行
  - /html/step2.htmlに戻る
* /php/step4.php
  - /R_Python_sh/remove_get_data.shを実行

パラメータの再設定をするため，先に設定したnotchとpngsを元に/get_data/に出力した画像を削除
* /R_Python_sh/remove_tda.sh

次の使用者？のために/get_data/内の画像を削除
* /R_Python_sh/remove_get_data.sh

画像表示用に[ここ](http://on-ze.com/archives/1658)を参考に使用
* /js/jquery.bxslider.js
* /css/jquery.bxslider.css

#### STEP.4
新規タブでTDA適用結果，つまりバーコードを表示
* /html/step4.html --> step2.phpで書き出した/result/barcode.pngを表示
* /css/main.css
* /php/retry.php
  - /R_Python_sh/remove_result.shを実行
  - /html/step1.htmlに戻る

次の使用者？のために/result/barcode.pngを削除
* /R_Python_sh/remove_result.sh

## その他ファイル
#### /sample_data/
STEP.1で選択する用のサンプルデータ
* 1dimention：1次元データ
* 2dimention：2次元データ

行列の有無，欠損値の有無，ファイルの種類，データの違いなど，様々なパターンを想定して作成．

#### /etc/
ボツになったプログラム，コンテンツ作成用のファイル置き場
