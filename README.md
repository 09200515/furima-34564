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
- has_many :orders

## items テーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| price            | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| shipping_area_id | integer    | null: false       |
| shippment_id     | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery

## deliverys テーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| postal_cord      | string     | null: false       |
| shipping_area_id | integer    | null: false       |
| city             | string     | null: false       |
| address_line1    | string     | null: false       |
| address_line2    | string     |                   |
| phone_number     | string     | null: false       |
| order            | references | foreign_key: true |

### Association

- belongs_to :order

