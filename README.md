# README
# furima-31520

## Usersテーブル

| Column              | Type   |  Options                               |
| ------------------  | ------ | ---------------------------------------|
| last_name           | string | null: false                            |
| first_name          | string | null: false                            |
| last_kana           | string | null: false                            |
| first_kana          | string | null: false                            |
| nickname            | string | null: false                            |
| birthday            | date   | null: false                            |
| email               | string | null: false, default: "", unique: true |
| encrypted_password  | string | null: false, default: ""               |

### Association

- has_many :items
- has_many :purchase_record

## Itemsテーブル

| Column          | Type           |  Options                        |
| --------------- | -------------- | ------------------------------- |
| name            | string         | null: false                     |
| memo            | text           | null: false                     |
| category_id     | integer        | null: false                     |
| condition_id    | integer        | null: false                     |
| price           | integer        | null: false                     |
| days_to_ship_id | integer        | null: false                     |
| shipping_fee_id | integer        | null: false                     |
| ship_to_id      | integer        | null: false                     |
| user            | references     | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase_record

## Purchase_recordsテーブル
| Column                   | Type           |  Options                        |
| ------------------------ | -------------- | ------------------------------- |
| user                     | reference      | null: false, foreign_key: true  |
| item                     | reference      | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Addressesテーブル
| Column            | Type      |  Options                        |
| ----------------  | --------- | ------------------------------- |
| zip_code          | string    | null: false                     |
| prefecture_id     | integer   | null: false                     |                     
| municipality      | string    | null: false                     |                     
| address           | string    | null: false                     |
| building          | string    |                                 |
| phone_no          | string    | null: false                     |
| purchase_record   | reference | null: false, foreign_key: true  |


### Association
- belongs_to :purchase_record
