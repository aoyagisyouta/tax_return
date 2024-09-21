## usersテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| user_name           | string     | null: false                    |

### Association
- has_many :properties

## propertiesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                     |
| postal_code       | string     | null: false                     |
| prefecture_id     | integer    | null: false, foreign_key: true  |
| city              | string     | null: false                     |
| street_number     | string     | null: false                     |
| room_number       | string     |                                |
| building_type_id  | integer    | null: false                |
| user_id           | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :income
- has_one :expense

## incomeテーブル

| Column         | Type       | Options                         |
| -------------- | ---------- | ------------------------------  |
| rent           | integer    | |
| key_money      | integer    | |
| other_income   | integer    | |
| property_id    | references | null: false, foreign_key: true  |


### Association
- belongs_to :property

## expensesテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| taxes               | integer    | null: false, default: 0        |
| loan_interest_rate  | integer    |          |
| management_fee      | integer    | null: false, default: 0        |
| brokerage           | integer    | null: false, default: 0        |
| advertising         | integer    | null: false, default: 0        |
| premium             | integer    | null: false, default: 0        |
| depreciation        | integer    | null: false, default: 0        |
| repair_cost         | integer    | null: false, default: 0        |
| other_expenses      | integer    | null: false, default: 0        |
| property_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :property