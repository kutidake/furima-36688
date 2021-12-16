## テーブル設計

## usersテーブル

|Column            |Type  |Options    |
|nickname          |string|null: false|
|email             |string|null: false,unique: true|
|encrypted_password|string|null: false|
|last_name          |string|null: false|
|last_name_f          |string|null: false|
|first_name         |string|null: false|
|first_name_f         |string|null: false|
|birth             |date  |null: false|

### Association
- has_many :items
- has_many :orders

## itemsテーブル

|Column            |Type   |Options    |
|item_name         |string |null: false|
|explanation       |text   |null: false|
|category          |string |null: false|
|condition         |string |null: false|
|charge            |integer|null: false|
|area              |string |null: false|
|hassoumadenonissuu|integer|null: false|
|price             |integer|null: false|
|user              | references | null: false, foreign_key: true  |

### Association
- belongs_to :users
- has_one :orders

## ordersテーブル

|Column            |Type   |Options    |
|user              | references | null: false, foreign_key: true  |
|item              | references | null: false, foreign_key: true  |

### Association
- has_many :users
- has_one :items

## addresssテーブル

|Column         |Type   |Options    |
|postcode       |integer|null: false|
|prefectures    |string |null: false|
|municipalities |string |null: false|
|house_number   |string |null: false|
|building       |string |
|telephone      |string |null: false|
|order          | references | null: false, foreign_key: true  |

### Association
- belongs_to :order