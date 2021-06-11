# テーブル設計

## users テーブル (ユーザー管理機能)

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first name         | string | null: false |
| last name          | string | null: false |
| first name kana    | string | null: false |
| last name kana     | string | null: false |
| birth date         |references| null: false |

### Association

- has_many :items
- has_many :purchase

##  item テーブル (商品出品機能)

| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| image                  |           | null: false |
| name                   | string    | null: false |
| info                   | text      | null: false |
| price                  | integer   | null: false |
| category               |references | null: false |
| sales status           |references | null: false |
| shipping fee status    |references | null: false |
| prefecture             |references | null: false |
| scheduled delivery     |references | null: false |
| user                   |references |             |

### Association

- belongs_to :user 
- has_one :purchase
 
## purchase テーブル (商品購入機能)

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| token              |           | null: false |
| user               | references|             |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address



## address テーブル (配送先住所)

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| postal code        | integer   | null: false |
| prefecture         |references | null: false |
| city               |  string   | null: false |
| addresses          |  string   | null: false |
| phone number       |  integer  | null: false |

### Association

- belongs_to :purchase




