# try linux on docker
dockerを使用してLinuxを触ってみよう。
Linuxを仮想的に立ち上げるには`virtual box`がおすすめされますが、最近ではM1Macでは動かすことができません。

dockerをインストールすれば、Linuxを勉強できるを目指しました。

大きく三つのことをよく説明することが多いのでそれを解決できるような資料を目指しています。

ディレクトリ構成
```
course/ #用意しているコースです。
  - 1. Linux同士でネットワークの疎通しているかを確認する方法を学びます。
  - 2. PATHの通し方を普段よりもう一歩踏み込んで学習します。
  - 3. フレームワークなどから接続したいMysqlと疎通出来ない時の解決方法の足掛かりを学びます。
docker/ #debianのDockerfileが入っています。
mysql/ #mysqlのDockerfileが入っています。
compose.yml
```
