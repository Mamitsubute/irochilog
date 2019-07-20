#  Environment

## Vue のために導入が必要なもの

### yarn

nodejs 系のライブラリの管理を行います．  
Vue.js と連携して動作する Webpakcer は必要な
ライブラリを yarn を使って解決・取得するため，
本ツールの導入が必要となります．

以下，vagrant 環境(Ubuntu 18.04)での導入手順を記載する．

まず，nodejs 実行環境を導入する．nodejs はバージョン
アップ頻度，バージョン間の差異が激しいので，マネージャ n を導入する．

```
sudo apt install -y nodejs npm
sudo npm install n -g
sudo n stable
sudo apt purge -y nodejs npm
exec $SHELL -l
node -v
```

※ 各コマンドの詳細については以下の参考リンクを参照してほしい．  
  https://qiita.com/seibe/items/36cef7df85fe2cefa3ea

nodejs 実行環境が整ったので，yarn をさくっと導入する．
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```

### 必要ライブラリの導入

yarn.lock が最新になっていれば，以下を叩けば必要なライブラリが一括で導入されます．

```
yarn
```

## Application 動作に必要なも

### .env ファイルの作成

Project ルートディレクトリ直下に `.env` ファイルを作成してください．
`.env` ファイルには `DATABASE_HOST="localhost"` のような書式で記載します．
以下に設定が必要なパラメータの一覧を示します．

|parameter|e.g. value|explain|
|---------|----------|-------|
|TWITTER_API_KEY|{random ascii}|Twitter API key|
|TWITTER_API_SECRET|{random ascii}|Twitter API secret key|
|DATABASE_HOST|localhost|your database hostname|
|DATABASE_PORT|5432|if U use postgresql, maybe 5432|
|DATABASE_USER|postgres|if U use postgres, maybe postgres or your app name|
|DATABASE_PASSWORD|xxxx||





以上
