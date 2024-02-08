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

## Categoriesテーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association
has_many :incomes
has_many :payments