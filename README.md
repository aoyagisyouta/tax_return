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
| taxes               | integer    |              |
| loan_interest_rate  | integer    |              |
| management_fee      | integer    |              |
| brokerage           | integer    |              |
| advertising         | integer    |              |
| premium             | integer    |              |
| depreciation        | integer    |              |
| repair_cost         | integer    |              |
| other_expenses      | integer    |              |
| property_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :property