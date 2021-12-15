## テーブル設計

## usersテーブル

|Column            |Type  |Options    |
|nickname          |string|null: false|
|email             |string|null: false|
|encrypted_password|string|null: false|
|lastname          |string|null: false|
|firstname         |string|null: false|
|birth             |date  |null: false|

### Association
- has_many :items
- has_many :orders

## itemsテーブル

|Column            |Type   |Options    |
|image             |string |null: false|
|itemname          |string |null: false|
|explanation       |string |null: false|
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
|banti          |string |null: false|
|building       |string |
|telephone      |integer|null: false|

### Association
- has_one :orders