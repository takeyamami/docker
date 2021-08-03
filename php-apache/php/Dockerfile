FROM php:apache

# TimeZoneの設定
RUN cp /usr/share/zoneinfo/Japan /etc/localtime

## aptの更新
RUN apt update

## sudoのインストール
RUN apt install sudo

## yumアップデート
RUN apt remove -y httpd

## wgetのインストール
RUN apt install -y wget

## SSHDのインストール            
RUN apt -y install openssh-server

## rootユーザーのパスワード変更         
RUN echo 'root:12345678' | chpasswd

## apacheユーザーの作成
RUN groupadd apache
RUN useradd -g apache apache

## 外部に公開するポートを指定
EXPOSE 22 80 443

## remiリポジトリの登録
#RUN apt install -y epel-release
#RUN apt -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

## composerのインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp
RUN mv /tmp/composer.phar /usr/local/bin/composer

## apacheの設定
COPY ./php/conf.d/ /etc/httpd/conf.d/

## make logs dir
#RUN mkdir /home/ec2-user/logs

## 起動スクリプトの指定
COPY ./php/startup.sh /etc/startup.sh
RUN chmod +x /etc/startup.sh
ENTRYPOINT /etc/startup.sh

