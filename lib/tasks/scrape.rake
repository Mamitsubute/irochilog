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
    #r2 = Regexp.compile('[\p{katakana}　ー－&&[^ -~｡-ﾟ]()（）]+(\(.+\))*')
    r2 = Regexp.compile('(\p{katakana}).*')
    doc.xpath('//tr[contains(@class, "w-idb-element")]').each do |node|
      raw = node.text
      # 809めるめたるメルメタル
      no = r.match(raw)[0]
      name = node.xpath('td/a').text
      #name = r2.match(raw)[0]
      # get type
      type_raw = node.attribute('data-col3').to_s
      #type = type_raw.split('<hr>').join(",")
      types = type_raw.split('<hr>')
      # get image url
      src_raw = node.xpath('td/a/img')
      url = src_raw.attribute("data-original")
#      puts "#{no} #{name} #{type} #{url}"

      # create models
      type_arr = []
      types.each do |t|
        if Type.where(:type_name => t).blank?
          type = Type.new(
            :type_name => t
          )
          type.save
        else
          type = Type.where(:type_name => t).first
        end
        type_arr.push type
      end
      pokemon = PocketMonster.new(
        :pokedex_number => no.to_i,
        :pokemon_name => name,
        :image_url => url
      )
      pokemon.save
      type_arr.each do |ta|
        PocketMonsterType.new(
          :pocket_monster_id => pokemon.id,
          :type_id => ta.id
        ).save
      end
   end
  end
end
