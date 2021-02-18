# furimaのER図

## users テーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| firstname     | string  | null: false |
| lastname      | string  | null: false |
| birthday      | integer | null: false |
| kanafirstname | string  | null: false |
| kanalastname  | string  | null: false |

### Association

## products テーブル
| Column       | Type    | Options            |
| ------------ | ------- | ------------------ |
| productname  | string  | null: false        |
| image        |         | ActiveStorageで実装 |
| description  | text    | null: false        |
| category     | string  | null: false        |
| status       | string  | null: false        |
| price        | integer | null: false        |
| deliveryfee  | string  | null: false        |
| shippingarea | string  | null: false        |
| shippment    | string  | null: false        |

### Association

## records テーブル
| Column   | Type       | Options |
| -------- | ---------- | ------- |
| user     | references |         |
| product  | references |         |

### Association

## deliverys　テーブル
| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| postalcord   | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| addressline1 | string     | null: false |
| addressline2 | string     | null: false |
| phonenumber  | integer    | null: false |
| record       | references | null: false |

### Association

