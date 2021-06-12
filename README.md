# テーブル設計

## users テーブル (ユーザー管理機能)

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string |unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         |  date  | null: false |

### Association

- has_many :items
- has_many :purchases

##  items テーブル (商品出品機能)

| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| name                   | string    | null: false |
| info                   | text      | null: false |
| price                  | integer   | null: false |
| category_id            | integer   | null: false |
| sales_status_id        | integer   | null: false |
| shipping_fee_status_id | integer   | null: false |
| prefecture_id          | integer   | null: false |
| scheduled_delivery_id  | integer   | null: false |
| user                   |references |foreign_key :true|

### Association

- belongs_to :user 
- has_one :purchase
 
## purchases テーブル (商品購入機能)

| Column             | Type      | Options         |
| ------------------ | --------- | ----------------|
| user               | references|foreign_key :true|
| item               | references|foreign_key :true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル (配送先住所)

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| postal_code        | string    | null: false |
| prefecture_id      | integer   | null: false |
| city               |  string   | null: false |
| addresses          |  string   | null: false |
| building           |  string   |             |
| phone_number       |  string   | null: false |

### Association

- belongs_to :purchase




