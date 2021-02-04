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
| birthday           | data   | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :purchases

## items テーブル

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| name        | string    | null: false |
| information | text      | null: false |
| price       | integer   | null: false |
| user        | reference | null: false, foreign_key:true |
| category_id | integer   | null: false |
| state_id    | integer   | null: false |
| cost_id     | integer   | null: false |
| place_id    | integer   | null: false |
| day_id      | integer   | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase



## comments テーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| text   | text      | null: false |
| user   | reference | null: false, foreign_key:true |
| item   | reference | null: false, foreign_key:true |


### Association

- belongs_to :user
- belongs_to :item

  ### purchaseテーブル
  
  | Column             | Type      | Options     |
  | ------------------ | --------- | ----------- |
  | user               | reference | null: false, foreign_key:true |
  | item               | reference | null: false, foreign_key:true |
  
  ### Association
  - belongs_to :user


 
  ### delivery_addressテーブル  
  | Column           | Type      | Options     |
  | ---------------- | --------- | ----------- |
  | post_code        | strings   | null: false |
  | prefecture       | integer   | null: false |
  | municipality     | strings   | null: false |
  | address          | strings   | null: false |
  | building         | strings   |
  | telephone_number | strings   | null: false |
  | purchase         | reference | null: false, foreign_key:true |

 ### Association

-has_one :purchase
