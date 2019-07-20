require 'open-uri'

namespace :scrape do

  desc 'pokemon list 一括取得'
  task :get_pokemon => :environment do
    # スクレイピング先のURL
    url = 'https://pokemongo.gamewith.jp/article/show/26775'

    charset = nil
    html = open(url) do |f|
      charset = f.charset # 文字種別を取得
      f.read # htmlを読み込んで変数htmlに渡す
    end

    # htmlをパース(解析)してオブジェクトを作成
    doc = Nokogiri::HTML.parse(html, nil, charset)

    r = Regexp.compile('^[0-9]*')
    r2 = Regexp.compile('[\p{katakana}　ー－&&[^ -~｡-ﾟ]()（）]+(\(.+\))*')
    doc.xpath('//tr[contains(@class, "w-idb-element")]').each do |node|
      raw = node.text
      # 809めるめたるメルメタル
      no = r.match(raw)[0]
      name = r2.match(raw)[0]
      # get type
      type_raw = node.attribute('data-col3').to_s
      type = type_raw.split('<hr>').join(",")
      # get image url
      src_raw = node.xpath('td/a/img')
      url = src_raw.attribute("data-original")
      puts "#{no} #{name} #{type} #{url}"
    end
  end
end
