# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| ----------------- | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| firstname         | string | null: false |
| lastname          | string | null: false |
| katakanafirstname | string | null: false |
| katakanalastname  | string | null: false |
| birthday          | data   | null: false |

### Association

- has_many :items
- has_many :comments

## items テーブル

| Column   | Type      | Options     |
| -------- | --------- | ----------- |
| name     | string    | null: false |
| price    | integer   | null: false |
| user     | reference |
| category | string    | null: false |
| state    | string    | null: false |
| cost     | string    | null: false |
| price    | string    | null: false |
| day      | date      | null: false |

### Association

- belongs_to :users
- has_many :comments

## comments テーブル

| Column | Type      | Options     |
| -------- | --------- | ----------- |
| text     | text    | null: false |
| user    | reference   |
| item     | reference |


### Association

- belongs_to :users
- belongs_to :comments
