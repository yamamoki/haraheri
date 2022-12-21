# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'admin@test.jp', password: '123123')

tags = Tag.create!([
  { name: '火を使わない' },
  { name: '包丁要らず' },
  { name: '調理時間10分以下' },
  { name: 'その他' },
  { name: '簡単な作り置き' }
])

 users = User.create!([
    {email: 'haru@test.com', name: 'はる', password: 'hhhhhh' },
    {email: 'natu@test.com', name: 'なつ', password: 'nnnnnn' },
    {email: 'aki@test.com', name: 'あき', password: 'aaaaaa' },
    {email: 'huyu@test.com', name: 'ふゆ', password: 'hhhhhh' }
 ])

list = List.create!(
    user_id: users[0].id,
    title: "公開",
    material: "公開\r\n写真未選択",
    body: "公開\r\n写真未選択\r\nテスト\r\nテスト\r\nテスト\r\nテスト\r\nテスト\r\nテスト\r\n火を\r\n包丁",
    tag_ids: tags[0].id,
    draft: "release")
    list.image.attach(io:
File.open(Rails.root.join("./app/assets/images/haraheri.png")), filename:"haraheri.png")
