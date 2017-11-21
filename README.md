トポロジカルデータ分析説明サイト
=======

## はじめに
トポロジカルデータ分析をイメージしてもらいやすくするため，またデータ分析をシステムとして実装する勉強も兼ねて，ユーザの入力データに対してトポロジカルデータ分析を行い，仕組みや結果を可視化するサイトを作成中．

**Topological Data Analysis (TDA) とは**  
位相幾何学を利用しデータの分布の形状に着目する新しいデータ分析手法．

位相幾何学（Topology）とは，角度や距離などの様々な性質が失われたも残る性質をみるものである．  
位相幾何学では，図形を連続的に変化（霧針なしの変形）が許され，それでも残る性質を「位相不変量」という．位相不変量には幾つかの種類があるが，そのうちの一つに「穴」がある．穴に着目すれば，ドーナツと取っ手のついたコーヒーカップは同じ性質と捉えることができる．これは，コーヒーカップを変形すればドーナツのような形にすることができるためである．  
位相幾何学における穴には下図に示すように，データ点そのものを意味する0次の穴，一般的な穴のイメージである1次の穴，空洞を意味する2次の穴というように種類がある．  
<div align="center">
<img src="https://github.com/nakayamarina/TDA_tryweb/blob/master/img/Holes.png" alt="holes" title="holes" width="400" height="150">
</div>

これらの穴に着目してデータ分布の形状を捉えるのが，TDAのPersistent Homologyである．Persistent Homologyはデータ点の直径の変化に伴う穴の発生と消滅情報をみることでデータ全体の形を捉えるものである．  
データというのは特徴空間において点の集合であるため，どのようなものを穴と捉えるかという問題がある．そこでPersistent Homologyでは，データの点をボール状に膨らませることで，連結した図形の穴に着目する．穴の形状により穴の発生と消滅のタイミングは異なるため，データ点の分布の形状の特性を捉えることが可能となる．そして，データ点の直径の変化に伴う穴の発生と消滅の情報を可視化する技術にバーコードがある（下図）．  
<div align="center">
<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/readme/hole.png" alt="ph" title="ph" width="400" height="100" align = "center">  


<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/readme/pd.png" alt="ph" title="ph" width="300" height="180" align = "center">
</div>

## 動作環境
* MAMP
* Python 3.6.1(Anaconda 4.4.0)
* R 3.3.2
  - TDA
* PHP 7.1.8

## DEMO

<div align="center">
<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/readme/demo.gif" alt="holes" title="holes" width="700" height="500">
</div>

## 構成

<div align="center">
<img src="https://github.com/nakayamarina/TDA_tryweb/blob/readme_cntnt/readme/tda_tryweb.png" alt="holes" title="holes" width="500" height="300">
</div>

### 構成図

### トップページ
#### Topological Data Analysis

### 説明
#### WHAT

### 体験
#### STEP.1

#### STEP.2

#### STEP.3

#### STEP.4
