
## users テーブル

| Column                    | Type       | Options           |
| ------------------------- | ---------- | ----------------- |
| nickname                  | string     | null: false       |
| email                     | string     | null: false       |
| password                  | integer    | null: false       |
| password_confirmation     | integer    | null: false       |
| family_name               | string     | null: false       |
| first_name                | string     | null: false       |
| family_name_kana          | string     | null: false       |
| first_name_kana           | string     | null: false       |
| birthday                  | date       | null: false       |
| lists_id                  | references | foreign_key: true |
| buys_id                   | references | foreign_key: true |

### Association

- has_many :lists
- has_one :buy

## lists テーブル

| Column              | Type       | Options           |
| ------------------  | ---------- | ----------------- |
| title_id            | integer    | null: false       |
| text_id             | integer    | null: false       |
| category_id         | integer    | null: false       | 
| status_id           | integer    | null: false       |
| shipping_charges_id | integer    | null: false       |
| shipment_source_id  | integer    | null: false       |
| shipping_days_id    | integer    | null: false       |
| price               | integer    | null: false       |
| users_id            | references | foreign_key: true |
| buys_id             | references | foreign_key: true |
| comments_id         | references | foreign_key: true |

### Association

- has_one :buy
- belongs_to :user
- has_many :comments

## buys テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_code     | string     | null: false       |
| prefectures_id  | integer    | null: false       |
| municipality    | string     | null: false       |
| address         | string     | null: false       |
| building_name   | string     |                   |
| phone_number    | string     | null: false       |
| users_id        | references | foreign_key: true |
| lists_id        | references | foreign_key: true |

### Association

- belongs_to :list
- belongs_to :user

## comments テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- | 
| text     | string     | null: false       |
| lists_id | references | foreign_key: true |
### Association

- belongs_to :comment