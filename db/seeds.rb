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
    {email: 'huyu@test.com', name: 'ふゆ', password: 'hhhhhh' },
    {email: 'test@test', name: 'test', password: 'tttttt' }
 ])

list = List.create!(
    user_id: users[1].id,
    title: "マグカップで茶碗蒸し",
    material: "卵　１個\r\n麺つゆ又は白だし　大さじ１\r\n水　150ml",
    body: "マグカップで卵をよく混ぜる
麺つゆと水を入れて混ぜる
ふんわりラップをして、500wで3分位
そのまま少しおいて余熱で固める
ネギやカニカマ等を入れても美味しいです。
失敗しても卵のスープになります",
    tag_ids: tags[1].id,
    draft: "release")
    list.image.attach(io:
File.open(Rails.root.join("./app/assets/images/test5.png")), filename:"test5.png")

list = List.create!(
    user_id: users[2].id,
    title: "鯖フレークの混ぜご飯",
    material: "・ご飯　１膳\r\n・鯖フレーク　お好みで\r\n・醤油　お好みで",
    body: "ご飯に鯖フレークを入れて混ぜる\r\nフレークに味がついてる為、味見をしながら醤油を入れる。必要無ければ入れなくても良い。
\r\n後は大葉、ネギ、胡麻、生姜等のお好みの薬味を入れても美味しい
\r\n他のフレークでも美味しく出来る",
    tag_ids: tags[2].id,
    draft: "release")
    list.image.attach(io:
File.open(Rails.root.join("./app/assets/images/test1.jpg")), filename:"test1.jpg")

list = List.create!(
    user_id: users[1].id,
    title: "レタスと豚肉のさっぱり蒸し",
    material: "レタス　半玉\r\n豚の薄切り　５枚\r\n塩コショウ　適量\r\n酒　大さじ１\r\nポン酢　お好みで",
    body: "耐熱皿に千切ったレタスを入れ、その上に豚肉を広げて乗せる。
塩コショウと酒を豚肉にかかるようにふる。
ラップをふんわりして、レンジで５〜６分で完成。
ポン酢をかけてお食べください。",
    tag_ids: tags[0].id,
    draft: "release")
    list.image.attach(io:
File.open(Rails.root.join("./app/assets/images/test3.png")), filename:"test3.png")


list = List.create!(
    user_id: users[2].id,
    title: "天かすのおにぎり",
    material:"ご飯　１合\r\n天かす　大さじ３\r\n大葉　４枚\r\nめんつゆ　大さじ１\r\nごま油　大さじ１",
    body: "大葉をみじん切りにする。
材料を全部混ぜておにぎりにする。面倒ならおにぎりにせずに食べる。",
    tag_ids: tags[0].id,
    draft: "release")
    list.image.attach(io:
File.open(Rails.root.join("./app/assets/images/no_image.png")), filename:"no_image.png")


list = List.create!(
    user_id: users[3].id,
    title: "大根の葉っぱのふりかけ",
    material: "・大根の葉っぱ　１本分\r\n・ちりめんじゃこ　お好みで\r\n・塩揉み用の塩　小さじ１位\r\n・ごま油　大さじ１位\r\n・醤油／みりん　お好みで\r\n・鰹節　小分け袋１個",
    body: "大根の葉っぱをみじん切りにする。\r\n
袋かボールに入れて塩揉みする。\r\n
葉っぱから出た水分を切りながらごま油のしいたフライパンに入れる。\r\n
ちりめんじゃこ、醤油、みりんをフライパンに入れて中火位で調味料が全体染みるまで炒める。\r\n
・材料は全部火が通っていなくても平気なものなので大体の目安でOK\r\n
・調味料は、最初に塩揉みしている為味見をしながらいれる。ふりかけやお茶漬け、豆腐にかける等で使う為に多少塩辛くてOK\r\n
タッパー等の保存容器に入れて、鰹節を上からかけて（他の具材と一緒に炒めてもOK）粗熱をとってから冷蔵庫へ。",
    tag_ids: tags[4].id,
    draft: "release")
    list.image.attach(io:
File.open(Rails.root.join("./app/assets/images/test2.jpg")), filename:"test2.jpg")

list = List.create!(
    user_id: users[0].id,
    title: "サーモン漬け",
    material: "サーモン　150g\r\n味ぽん　大さじ1\r\n醤油　小さじ2\r\n水　大さじ２\r\nおろしニンニク　小さじ1/2",
    body: "袋に全部入れて冷蔵庫に3時間以上漬ける。
ご飯のお供にどう",
    tag_ids: tags[0].id,
    draft: "release")
    list.image.attach(io:
File.open(Rails.root.join("./app/assets/images/test4.png")), filename:"test4.png")


