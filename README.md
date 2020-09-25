
## users テーブル

| Column                    | Type    | Options     |
| ------------------------- | ------- | ----------- |
| nickname                  | string  | null: false |
| email                     | string  | null: false |
| password                  | integer | null: false |
| password_confirmation     | integer | null: false |
| family_name               | string  | null: false |
| first_name                | string  | null: false |
| family_name_kana          | string  | null: false |
| first_name_kana           | string  | null: false |
| year                      | date    | null: false |
| moon                      | date    | null: false |
| day                       | date    | null: false |

### Association

- has_many :lists
- has_one :buys

## lists テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| image            | timestamp | null: false |
| title            | string    | null: false |
| text             | text      | null: false |
| category         | string    | null: false |
| status           | string    | null: false |
| shipping_charges | string    | null: false |
| shipment_source  | string    | null: false |
| shipping_days    | integer   | null: false |
| price            | integer   | null: false |

### Association

- has_one :buys
- belongs_to :users
- has_many :comments

## buys テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ------------|
| number          | integer    | null: false |
| expiration_date | date       | null: false |
| security_code   | integer    | null: false |
| postal_code     | integer    | null: false |
| prefectures     | string     | null: false |
| municipality    | string     | null: false |
| address         | integer    | null: false |
| building_name   | string     | null: false |
| phone_number    | integer    | null: false |

### Association

- belongs_to :lists
- belongs_to :users

## comments テーブル

| Column  | Type       | Options      |
| ------- | ---------- | ------------ |
| text    | string     | null: false  |

### Association

- belongs_to :comments