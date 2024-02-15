## usersテーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| name               | string | null:false              |
| email              | string | null:false, unique:true |
| encrypted_password | string | null:false              |
| birthday           | date   | null:false              |

### Association
has_many :incomes
has_many :payments
has_one :limit

## incomesテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null:false, foreign_key:true |
| price              | integer    | null:false                   |
| category_id        | integer    | null:false                   |
| date               | date       | null:false                   |

### Association
belongs_to :user
belongs_to :category, optional:true

## paymentsテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null:false, foreign_key:true |
| price              | integer    | null:false                   |
| category_id        | integer    | null:false                   |
| date               | date       | null:false                   |

### Association
belongs_to :user
belongs_to :category, optional:true


## limitsテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user               | references | null:false, foreign_key:true |
| goal               | integer    | null:false                   |

### Association
belongs_to :user


## Categoriesテーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association
has_many :incomes
has_many :payments