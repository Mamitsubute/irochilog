# Twitter API 連携方法

2019/07/19 ambe

以下を参考にした。  
https://qiita.com/kami_zh/items/94aec2d94a2b4e9a1d0b

## Rails 側で必要な設定

- Gemfile を編集  
  `devise` `omniauth` `omniauth-twitter` を追加
- `bin/bundle install` 実施
- devise コンフィグファイルなど生成 `bin/rails g devise:install`
- 日本語化ファイルを wget し、`config/locales/devise.ja.yml` として配置  
  https://raw.githubusercontent.com/tigrish/devise-i18n/master/rails/locales/ja.yml
- User モデルはすでにあったので、以下のように devise 設定を追加
- twitter 連携で使用するカラムを migration 追加  
  `bin/rails g migration AddColumnsToUsers uid:string provider:string`
- migration 実施 `bin/rake db:migrate`

## devise で使用する DB 定義

基本(devise 標準で有効になっているオプションで使用するカラム)  
db/migrate/20190715075059_devise_create_users.rb  
Twitter 連携(omniauth)で使用するカラム  
db/migrate/20190715075237_add_columns_to_users.rb

## Twitter 側で必要な設定

### App 用の Twitter アカウントを取得する

アカウントの取得については省略。
今回は以下を取得した。

https://twitter.com/irochilog

準備 OK

### Twitter 側で アプリケーション連携を許可するよう設定する

application の登録は以下から行う。

https://developer.twitter.com/en/apps

作成時に Twitter API 使うためのアンケートがあったので、以下のように回答した。
使わなさそうな API については not use で無効化。

In English, please describe how you plan to use Twitter data and/or APIs. The more detailed the response, the easier it is to review and approve.
```
I planned to login our product via Twitter account for user. This function is very useful to users to starting our product. And also I planned to tweet our product news(e.g. what is now updated and so on), follow our product users.
```

Will your app use Tweet, Retweet, like, follow, or Direct Message functionality?
```
I planned to tweet our product news(e.g. what is now updated and so on). and follow our product users.
```

無事にアカウント登録できたら、ダッシュボードから「Settings」を選び、callback に以下のように設定を行う。
* Callback URL を以下のように設定する  
  ``  
  こちらも参考： https://saruwakakun.com/memo/omniauth-twitter  
  ただし、localhost 系の設定については、production リリース時には外すのが懸命だろう。
* `Allow this application to be used to Sign in with Twitter` にチェック

