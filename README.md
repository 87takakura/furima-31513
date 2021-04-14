#アプリケーションの説明

##アプリケーション名	


##アプリケーション概要	
キャンプ場の情報共有サイト
キャンプ場情報の投稿、閲覧、コメント
記事投稿者とのチャット


##URL	デプロイ済みのURLを記述。デプロイが済んでいない場合は、デプロイが完了次第記述すること。

##テスト用アカウント	
ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。

##利用方法
ユーザー登録、ログインし記事を投稿する。


##目指した課題解決


##洗い出した要件	スプレッドシートにまとめた要件定義を記述。

##実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

##実装予定の機能	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。

##データベース設計	ER図等を添付。

##ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。























# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true|
| encrypted_password | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| katakanafirstname  | string | null: false |
| katakanalastname   | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| name        | string    | null: false |
| information | text      | null: false |
| price       | integer   | null: false |
| user        | references | null: false, foreign_key:true |
| category_id | integer   | null: false |
| state_id    | integer   | null: false |
| cost_id     | integer   | null: false |
| place_id    | integer   | null: false |
| day_id      | integer   | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :order



## comments テーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| text   | text      | null: false |
| user   | references | null: false, foreign_key:true |
| item   | references | null: false, foreign_key:true |


### Association

- belongs_to :user
- belongs_to :item

  ### ordersテーブル
  
  | Column             | Type      | Options     |
  | ------------------ | --------- | ----------- |
  | user               | references | null: false, foreign_key:true |
  | item               | references | null: false, foreign_key:true |
  
  ### Association
  -belongs_to :user
  -belongs_to :item
  -has_one :delivery_address


 
  ### delivery_addressテーブル  
  | Column           | Type      | Options     |
  | ---------------- | --------- | ----------- |
  | post_code        | string  | null: false |
  | place_id     | integer   | null: false |
  | municipality     | string   | null: false |
  | address          | string  | null: false |
  | building         | string  |
  | telephone_number | string | null: false |
  | order         | references | null: false, foreign_key:true |

 ### Association

-belongs_to :orders
