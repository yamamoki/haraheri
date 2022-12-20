# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'admin@test.jp', password: '123123')

Tag.create([
  { name: '火なぞ使わぬ' },
  { name: '包丁は要らぬ' },
  { name: '15分もかからぬ' },
  { name: 'その他じゃ' },
  { name: '簡単な作り置き' }
])

 users = User.create!([
    {email: 'haru@test.com', name: 'はる', password: 'hhhhhh' },
    {email: 'natu@test.com', name: 'なつ', password: 'nnnnnn' },
    {email: 'aki@test.com', name: 'あき', password: 'aaaaaa' },
    {email: 'huyu@test.com', name: 'ふゆ', password: 'hhhhhh' }
 ])