
## users テーブル

| Column                          | Type       | Options           |
| ------------------------------- | ---------- | ----------------- |
| nickname                        | string     | null: false       |
| email                           | string     | null: false       |
| encrypted_password              | string     | null: false       |
| family_name                     | string     | null: false       |
| first_name                      | string     | null: false       |
| family_name_kana                | string     | null: false       |
| first_name_kana                 | string     | null: false       |
| birthday                        | date       | null: false       |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| text                | text       | null: false                    |
| category_id         | integer    | null: false                    | 
| status_id           | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| shipment_source_id  | integer    | null: false                    |
| shipping_days_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user_id             | integer    | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| user_id         | integer | null: false, foreign_key: true |
| item_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ | 
| postal_code     | string  | null: false                    |
| prefectures_id  | integer | null: false                    |
| municipality    | string  | null: false                    |
| address         | string  | null: false                    |
| building_name   | string  |                                |
| phone_number    | string  | null: false                    |
| orders_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :order