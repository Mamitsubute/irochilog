# Scraping spec.

2019.07.19 ambe

## How to Getting Pokemon Name

ポケモン API をいくつか検討したが，PokemonGO に最適化された
情報を引き出せるものが見当たらなかったので，下記攻略サイトから
スクレイピングすることで必要な情報を取得する．

https://pokemongo.gamewith.jp/article/show/26775

## Building Web Scraping tool

以下の記事を参考に rake task として web scraping を行うツールを
作成する．
参考： https://morizyun.github.io/blog/nokogiri-scraping-ruby-rails-begineer/index.html


- Gemfile に nokogiri gem を追加する  
  `gem 'nokogiri'`  
  `bin/bundle install` 実行で install できれば OK
- rake task を作成する  
  `bin/rails g task scrape`
- script を作成する  
  実装については `lib/task/scrape.rake` を参照してください．
  - 取得先サイトについては chrome 開発者ツールをもとに，適切な XPath を設定した．
  - マスタ系の DB への値注入までを行う

## Execute script

rake task としてふつうに実行すればよい．

```
bin/rake scrape:get_pokemon
```

以上


