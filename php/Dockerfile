FROM amazonlinux:2018.03-with-sources

# FROM php:7.1.13-apache
# TimeZoneの設定
RUN cp /usr/share/zoneinfo/Japan /etc/localtime

## yumアップデート
RUN yum -y update
RUN yum remove -y httpd

## httpd-toolsアンインストール
RUN yum remove -y httpd-tools

## apacheのインストール：v2.4.6
RUN yum install -y httpd24

## wgetのインストール
RUN yum install -y wget

## SSHDのインストール            
RUN yum -y install openssh-server

## rootユーザーのパスワード変更         
RUN echo 'root:12345678' | chpasswd

## ec2-userユーザーの作成
RUN useradd ec2-user

## sudoのインストール
RUN yum -y install sudo

## 外部に公開するポートを指定
EXPOSE 22 80 443

## remiリポジトリの登録
RUN yum install -y epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm

## php7.1インストール
RUN yum remove php-*
RUN yum -y install php71 php71-cli php71-devel php71-common php71-mbstring php71-mysql php71-fpm php71-pdo php71-gd php71-xml php71-mcrypt php71-mysqlnd

## composerのインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/tmp
RUN mv /tmp/composer.phar /usr/local/bin/composer

## apacheの設定
COPY ./php/conf.d/ /etc/httpd/conf.d/

## make logs dir
RUN mkdir /home/ec2-user/logs

## 起動スクリプトの指定
COPY ./php/startup.sh /etc/startup.sh
RUN chmod +x /etc/startup.sh
ENTRYPOINT /etc/startup.sh

