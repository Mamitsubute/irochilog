# docker-compose

## Docker 下準備

### Docker Desktopのインストール
以下のURLからインストーラをダウンロードしてインストール
https://www.docker.com/products/docker-desktop

### Windowsの場合のGitのオプション変更
Windowsの場合、改行コードがCRLFになってしまうので、これを無効にしておく。

```
git config --global core.autoCRLF false
```
## Dockerコンテナのビルド
ターミナルやコマンドプロンプトで、プロジェクトのディレクトリに移動し、以下のコマンドを実行。

```
docker-compose build
```


## webpakcerの導入
以下のコマンドを実行する。

```
docker-compose run web bundle install
docker-compose run web rails webpacker:install
docker-compose run web rails webpacker:install:vue
```

## vueファイルのビルド
以下のコマンドを実行する。

```
docker-compose run web bin/webpack
```

### コンテナの起動
以下のコマンドを実行する
```
docker-compose up
```

### データベースの初期作成及びマイグレーション
コンテナを起動したものと別のターミナルやコマンドプロンプトを開き、以下のコマンドを実行する

```
docker-compose run web rake db:create
docker-compose run web rake db:migrate
```

### railsページの表示

```
http://localhost:3000
```

## docker-compose操作一覧

### コンテナの起動
```
dokcer-compose up
```
バックグラウンドで実行する場合は以下のオプションを追加して実行
```
docker-compose up -d
```

### コンテナの停止
```
docker-compose stop
```

### コンテナの廃棄
```
docker-compose down
```

## トラブルシュート

### PostgreSQLが起動しない
ローカルの端末にインストールしているPostgreSQLとポートが競合している可能性あり。
アンインストールするか、ポートを変更する

### Dockerコンテナが起動しない
```
ERROR: for irochilog_db_1  Cannot start service db: b'driver failed programming external connectivity on endpoint irochilog_db_1 (3a34c1995111cbffed1ccd52895e29e92930449973eca135958e1460b2e8bcd3): Error starting userland proxy: mkdir /port/tcp:0.0.0.0:5432:tcp:172.30.0.2:5432: input/output error'

ERROR: for db  Cannot start service db: b'driver failed programming external connectivity on endpoint irochilog_db_1 (3a34c1995111cbffed1ccd52895e29e92930449973eca135958e1460b2e8bcd3): Error starting userland proxy: mkdir /port/tcp:0.0.0.0:5432:tcp:172.30.0.2:5432: input/output error'
ERROR: Encountered errors while bringing up the project.
```
上記のようなエラーの場合は、Docker Desktopを再起動する

### 下記のyarnエラーがでた
```
  Your Yarn packages are out of date!
  Please run `yarn install` to update.
'''
yarn installをするが、エラー消えず。
config/webpacker.ymlを編集し、check_yarn_integrity: falseとしたら解決
参考：https://github.com/rails/webpacker/blob/master/README.md
