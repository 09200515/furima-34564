# furimaのER図

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| birthday           | date    | null: false               |
| kana_first_name    | string  | null: false               |
| kana_last_name     | string  | null: false               |

### Association

- has_many :items
- has_many :records

## items テーブル
| Column           | Type    | Options            |
| ---------------- | ------- | ------------------ |
| item_name        | string  | null: false        |
| description      | text    | null: false        |
| category_id      | integer | null: false        |
| status_id        | integer | null: false        |
| price            | integer | null: false        |
| delivery_fee_id  | integer | null: false        |
| shipping_area_id | integer | null: false        |
| shippment_id     | integer | null: false        |

### Association

- belongs_to :user
- has_one :record

## records テーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :delivery

## deliverys テーブル
| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postal_cord   | string     | null: false       |
| prefecture    | string     | null: false       |
| city          | string     | null: false       |
| address_line1 | string     | null: false       |
| address_line2 | string     |                   |
| phone_number  | string     | null: false       |
| record        | references | foreign_key: true |

### Association

- has_one :record

