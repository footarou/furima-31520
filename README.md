# README
# furima-31520

## Usersテーブル

| Column       | Type   |  Options                 |
| ------------ | ------ | -------------------------|
| last_name    | string | null: false              |
| first_name   | string | null: false              |
| last_kana    | string | null: false              |
| first_kana   | string | null: false              |
| nickname     | string | null: false              |
| birthday     | date   | null: false              |
| email        | string | null: false, default: "" |
| password     | string | null: false, default: "" |

### Association

- has_many :items
- has_many :purchase_record

## Itemsテーブル

| Column       | Type           |  Options                        |
| ------------ | -------------- | ------------------------------- |
| item_name    | string         | null: false                     |
| image        | ActiveStorage  | null: false                     |
| memo         | string         | null: false                     |
| category     | string         | null: false                     |
| condition    | string         | null: false                     |
| price        | string         | null: false                     |
| days_to_ship | string         | null: false                     |
| shipping_fee | string         | null: false                     |
| ship_to      | string         | null: false                     |
| user         | references     | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase_record

## Purchase_recordsテーブル
| Column                   | Type           |  Options                        |
| ------------------------ | -------------- | ------------------------------- |
| user                     | reference      | null: false, foreign_key: true  |
| item                     | reference      | null: false, foreign_key: true  |
| address                  | reference      | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Ship_toテーブル
| Column        | Type     |  Options    |
| ------------  | -------- | ----------- |
| zip_code      | string   | null: false |
| prefecture    | string   | null: false |
| municipality  | string   | null: false |
| address       | string   | null: false |
| building      | string   |             |
| phone_no      | string   | null: false |

### Association
- belongs_to :purchase_record
