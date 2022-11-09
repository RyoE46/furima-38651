# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many: orders
- has_many: items



## itemsテーブル

| Column       | Type       | Options     |
|------------- | ---------- | ----------- |
| name         | string     | null: false |
| content      | text       | null: false |
| price        | integer    | null: false |
| user         | references | null: false |
| category_id  | integer    | null: false |
| condition_id | integer    | null: false |
| charge_id    | integer    | null: false |
| area_id      | integer    | null: false |
| delivery_id  | integer    | null: false |

### Association

- has_one: order
- belongs_to: user
- belongs_to: category
- belongs_to: condition
- belongs_to: charge
- belongs_to: area
- belongs_to: delivery
- has_one_attached: image



## shippingsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ----------- |
| post_code       | integer    | null: false |
| state           | string     | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building        | string     | null: ture  |
| phone_number    | integer    | null: false |

### Association

- belongs_to: order



## ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item
- has_one: shipping
