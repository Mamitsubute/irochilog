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

    doc.xpath('//tr[contains(@class, "w-idb-element")]').each do |node|
      raw = node.text
      no = raw.slice(0, 2)
      name = raw.slice(3..-1)
      name = name.gsub(/[0-9\.]/, '')
      puts "#{no} #{name}"
    end
  end
end
