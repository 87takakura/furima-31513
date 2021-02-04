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
- has_many :purchase

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
- has_one :purchase



## comments テーブル

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| text   | text      | null: false |
| user   | references | null: false, foreign_key:true |
| item   | references | null: false, foreign_key:true |


### Association

- belongs_to :user
- belongs_to :item

  ### purchaseテーブル
  
  | Column             | Type      | Options     |
  | ------------------ | --------- | ----------- |
  | user               | references | null: false, foreign_key:true |
  | item               | references | null: false, foreign_key:true |
  
  ### Association
  - belongs_to :user

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
  | purchase         | references | null: false, foreign_key:true |

 ### Association

-belongs_to :purchase
