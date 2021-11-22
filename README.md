# 真のナポリピッツァ部
## サービス概要
真のナポリピッツァ協会認定店(2021年11月現在全国88店舗)をグーグルマップ上に表示させ、簡単に探せるサービスです。  
[真のナポリピッツァ協会について](https://partenope.jp/about/vera_pizza.html)

## メインのターゲットユーザー
- ナポリピッツァが好きな人、おいしいピザが食べたい人
- 出先や旅行先で真のナポリピッツァ協会認定店があるかさっと探したい人
- 真のナポリピッツァ協会の認定店ってなに？？気になるっていう人

## ユーザーが抱える課題
- 真のナポリピッツァ協会認定店に行ってみたいが、公式サイトだと探しづらい
- 本格的なナポリピッツァのお店を知りたい
- ナポリピッツァが食べたかったのに適当にピザ屋さんに入ったらナポリピッツァじゃなかった
- 何でも良いからおいしいピザが食べたい

## 解決方法
- グーグルマップ上に真のナポリピッツァ協会認定店を表示させ店舗情報をすぐに表示できるようにする。
- 認定店を一覧表示が見れて、都道府県別や店舗名等で検索ができる。

## 実装予定の機能
**【MVP】**
  - グーグルマップ上に真のナポリピッツァ協会認定店(日本限定)を表示。
  - 認定店が無い都道府県は地図上でわかるように表示
  - Google Maps APIを使用  

**【リリース時】**
  - 認定店一覧ページ
  - 認定店詳細ページ(一般的な店舗情報に加え、職人名や使用薪窯メーカー等の特殊情報の欄を作る)
  - 店舗情報はホットペッパーの店名サーチAPIから一部取得予定。
  - マップ上から店舗情報ページへのリンクを表示。
  - 検索機能(都道府県別、店舗名)  

**【リリース後順次追加予定】**
  - ログイン機能
    - ログインしたユーザーは以下の機能が使える
    - コメント、画像投稿機能
    - Favoriteボタン機能
  - フィードバックをもらいながらその他新規機能導入

## なぜこのサービスを作りたいのか？
- ナポリピッツァを食べたい時にさっと認定店を探したいがどこが認定店なのかわかりにくい。(公式ページの認定店一覧が見づらいため)  
- 出先や旅行先でさくっと認定店が近くにあるか確認できるようにして認定店に行ける機会を増やしたい。  
- おいしさで感動できる食べ物のひとつ「ナポリピッツァ」というジャンルに興味をもってくれる人が増えてほしい。
- ナポリピッツァ界隈の活性化に貢献し、もっと身近に気軽においしいナポリピッツァが食べられる未来にしたい。
