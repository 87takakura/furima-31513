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
- has_many :purchases

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
- belongs_to :delivery_address
- belongs_to :purchase



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
  | user_id            | reference | null: false, foreign_key:true |
  | item_id            | reference | null: false, foreign_key:true |
  | credit_card_number | integer   | null: false |
  | expiration_date    | date      | null: false |
  | security_code      | integer   | null: false |
  
  ### Association
  - belongs_to :user
  - belongs_to :item

 
  ### delivery_addressテーブル  
  | Column           | Type      | Options     |
  | ---------------- | --------- | ----------- |
  | user_id          | reference | null: false, foreign_key:true |
  | item_id          | reference | null: false, foreign_key:true |
  | post_code        | integer   | null: false |
  | prefecture       | strings   | null: false |
  | municipality     | text      | null: false |
  | address          | text      | null: false |
  | building         | text      | null: false |
  | telephone_number | integer   | null: false |
 
 ### Association

-belongs_to :item

