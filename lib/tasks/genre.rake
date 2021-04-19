namespace :genre do
  desc "ジャンルのマスターデータを作成"
  task create: :environment do
    p "Genre create"
    Genre.create!(name: '推理')
    Genre.create!(name: '青春')
    Genre.create!(name: '恋愛')
    Genre.create!(name: 'SF')
    Genre.create!(name: 'ファンタジー')
    Genre.create!(name: 'ホラー')
    Genre.create!(name: 'ノンフィクション')
    Genre.create!(name: 'スポーツ')
  end
end
