## pathを通すとは？

bashの場合
https://www.gnu.org/software/bash/
`6.2 Bash Startup Files`
の項目に記載してある

#### ログインシェルの場合
interactive login shell, or with --login (`/bin/bash --login` で起動した場合)
~/.bash_profile, ~/.bash_login, and ~/.profile が読み込まれる。

#### ログインシェルではない場合 (`/bin/bash`で起動した場合)
interactive non-login shell
~/.bashrc が読み込まれる

### やってみよう
```
root@ubuntu:/# echo "export HOGE=huga" > ~/.bash_profile
root@ubuntu:/# cat ~/.bash_profile
```
ログインシェルではないのでHOGE=hugaは通ってない
```
% docker exec -it ubuntu_container bash
root@ubuntu:/# printenv
HOSTNAME=ubuntu.mydomain.local
PWD=/
HOME=/root
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
TERM=xterm
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/printenv
root@ubuntu:/# 
```
ログインシェルなのでHOGE=hugaが存在する。
```
% docker exec -it ubuntu_container bash --login
root@ubuntu:/# printenv
HOSTNAME=ubuntu.mydomain.local
PWD=/
HOME=/root
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
TERM=xterm
HOGE=huga
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/printenv
root@ubuntu:/# 
```
### 先ほど確認したPATHに自作コマンドを置いてみよう
```
root@ubuntu:/# echo "apt-get update && apt-get install vim -y" > /usr/local/bin/sugoi_command
root@ubuntu:/# /usr/local/bin/sugoi_command
root@ubuntu:/# chmod +x /usr/local/bin/sugoi_command
root@ubuntu:/# sugoi_command
```

ここで作成したプログラムと同様に、古いプログラムでは単一のバイナリしかない場合があります。
そういったプログラムをdockerや自分のパソコンで実行したい場合、PATHに該当のディレクトリを追加するか`/usr/local/bin/`などの既に記載されているディレクトリにプログラムを入れるとコマンドが通るようになります。

古いプロジェクトでよくあるもう忘れ去られたバージョンでしか動かないプログラムも私たちは仕事で動かせなければいけない機会があります。
その場合に対応できるdocker imageの作り方を考えてみましょう。

## rvm を用いてruby3.0が実行できるubuntuのイメージを作成しよう。

### 最近rubyで程よいエラーが出るのでrvmで ruby3.0をインストールしてみましょう

rvm 公式
https://rvm.io/rvm/install

### ruby 3.0を動くようにしてみよう

#### ヒント
最近20243/8現在 openSSLのデフォルトバージョンが3.0になっています。
このままではrubyがbuild出来ないのでopensslをダウングレードしましょう。
```
wget https://www.openssl.org/source/old/1.1.1/openssl-1.1.1w.tar.gz

$ tar xvf openssl-1.1.1w.tar.gz
$ cd openssl-1.1.1w/
$ ./config --prefix=/usr/local/openssl shared zlib
$ make
$ make install
$ openssl version
libssl.so.1.1が見つからないというエラーが出ます。
$ find /usr -name "libssl.so.1.1"
$ echo "/usr/local/openssl/lib/" > /etc/ld.so.conf.d/lib64.conf
$ ldconfig
もう一度opensslのバージョンを確認してみましょう
$ openssl version
```

## ここでrubyをインストールに必要だったコマンドを `Dockerfile` へ記述していきましょう。

## compose.ymlへ記載して起動してみよう。
debianに記載の例と`~/mysql/Dockerfile`が参考になります。
```
docker compose exec -it ubuntu bash 
ruby version
```

これでruby3.0が動作するubuntuのimageが誕生しました。
Dockerのイメージの作り方やdockerについて興味がある方は以下の書籍がおすすめです。
https://amzn.to/49JQWqF

#### 備考
macで一般的に使われるzsh 興味のある方は読んでみてください。
https://zsh.sourceforge.io/
https://zsh.sourceforge.io/Guide/zshguide02.html
2.5.10: Environment variables
2.5.11: Path
あたり

macOS では 標準のbashのバージョンが古い 
https://tech.blog.uribou.me/update-bash-on-macos/

