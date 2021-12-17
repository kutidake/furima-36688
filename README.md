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
|category_id          |integer |null: false|
|condition_id         |integer |null: false|
|charge_id            |integer|null: false|
|area_id              |integer |null: false|
|days_id              |integer|null: false|
|price             |integer|null: false|
|user              | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

|Column            |Type   |Options    |
|user              | references | null: false, foreign_key: true  |
|item              | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses

## addressesテーブル

|Column         |Type   |Options    |
|post_code      |string |null: false|
|area_id    |integer |null: false|
|municipalities |string |null: false|
|house_number   |string |null: false|
|building       |string |
|telephone      |string |null: false|
|order          | references | null: false, foreign_key: true  |

### Association
- belongs_to :order