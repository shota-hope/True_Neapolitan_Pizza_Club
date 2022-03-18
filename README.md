# 真のナポリピッツァ部
### https://www.napolipizza-club.com/

## サービス概要
**真のナポリピッツァ協会 認定店にナポリピッツァを食べに行こう**
真のナポリピッツァ部は、全国に約90店舗ある「真のナポリピッツァ協会」認定店を簡単に探せるサービスです。
[以前のREADME](https://github.com/shota-hope/True_Neapolitan_Pizza_Club/blob/main/README_old.md)

### サービスを作った思い
真のナポリピッツァ協会認定店に行きたい時に、公式ページの一覧やグルメアプリだと探しづらいと常々感じていました。
旅行先や出張先で後から確認すると認定店が近くにあったにも関わらず見逃してしまっていることもありました。
また、個人的に感動する程おいしい伝統料理「ナポリピッツァ」に興味を持ってくれる人を増やしたいという思い、
そしてナポリピッツァ業界の発展、活性化をさせ、もっと身近に気軽にナポリピッツァを食べに行ける未来を目指して本サービスを開発しました。

## 仕様画面と機能(抜粋)
|トップ1|トップ2|
| :---: | :---: |
|<img width="1440" alt="3585579cfa589886f50a8de61cc76352" src="https://user-images.githubusercontent.com/74855190/158947800-d79cef81-a135-498e-8dcf-e4783ff55498.png">|<img width="1440" alt="6ab28f748e19a8117de430f077c692b1" src="https://user-images.githubusercontent.com/74855190/158948894-64d49e17-1171-4fb8-8511-d168a3f7600f.png">|
|機能説明やナポリピッツァについての説明があります。|地図から、店名・地名フリーワード、都道府県別絞込みで探すことができます。|
<br />

|店舗一覧画面|店舗詳細画面|
| :---: | :---: |
|<img width="1440" alt="26b519df2d15b1ef987f903c18d8482f" src="https://user-images.githubusercontent.com/74855190/158947179-97848252-8601-4c15-a057-b14df25535f0.png">|<img width="1439" alt="92387c6ff5cd7f748574e091da9ec1d2" src="https://user-images.githubusercontent.com/74855190/158947260-c7eff92b-f5b0-4b54-8625-f0815b9856c8.png">|
|都道府県別、店名・地名で絞り込み検索できます。|店舗の詳細情報と地図、Twitter共有、行った！機能、口コミ投稿機能があります。スクロールすると店舗に対しての口コミ投稿一覧を表示させています。|
<br />

|投稿詳細画面|ユーザー詳細画面|
| :---: | :---: |
|<img width="1431" alt="079f69b51502ba2d04c34ffccd14963c" src="https://user-images.githubusercontent.com/74855190/158949203-193caa5d-2b1c-4f12-87f2-0c626ee4c4f1.png">|<img width="1433" alt="1bd5f830f8619ab14b9770030c03ca14" src="https://user-images.githubusercontent.com/74855190/158949219-5c7366b6-5776-47d8-b5bf-7ca3d7571240.png">|
|投稿の詳細、Twitter共有、画像の拡大表示ができます。|ユーザーのプロフィール、投稿一覧が見られます。行った！ボタンを押している店舗がある場合、訪問済み店舗一覧を確認できます。|

## 使用技術
**フロントエンド**
- Bootstrap
- jQuery

**バックエンド**
- Ruby 3.0.2
- Rails 6.1.4
- Maps JavaScript API

**インフラ**
- heroku
- AWS(S3)
### 機能一覧
- 認定店一覧
- 認定店詳細
- 検索機能(都道府県別セレクトボックス。地名、店名フリーワード検索)
- Maps JavaScript APIを使用しマップを埋め込み、認定店のマーカーを立てる(クリックすると吹き出しでリンク表示)
- Twitter共有
- 投稿機能
- 投稿詳細
- ユーザー詳細
- ユーザー編集
- 行った！機能(Geolocation APIを使用し現在地を取得しているため、実際に店舗の近くにいないと押すことができない)
- 行った店舗数によって昇級
- 行った店舗一覧

**ログイン後できること**

- 投稿機能(コメント、画像)
- ユーザー機能
- 行った！機能
## 画面遷移図
https://www.figma.com/file/Snb588ncBlxNxz972EKvSH/%E7%9C%9F%E3%81%AE%E3%83%8A%E3%83%9D%E3%83%AA%E3%83%94%E3%83%83%E3%83%84%E3%82%A1%E9%83%A8?node-id=0%3A1
## ER図
https://drive.google.com/file/d/1pcZf2kliGKNZJFALmPe5Ur4QJgY-6nuG/view?usp=sharing
