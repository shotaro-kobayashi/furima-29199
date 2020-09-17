# テーブル設計

## products テーブル

| Column          | Type   | Options     |
| --------------  | ------ | ----------- |
| product_name     | string| null: false |
| price           | integer| foreign_key: true |
| text            | text   | foreign_key: true | 
| user_id         | integer| foreign_key: true |  
| category_id     | integer| null: false |
| status_id       | integer| null: false |
| delivery_cost_id| integer| null: false |
| area_id         | integer| null: false |
| days_id         | integer| null: false |

belongs_to:users
has_one:information

## users テーブル

| Column     | Type   | Options     |
| -----------| ------ | ----------- |
| first_name | string | null: false |
| last_name  | string | null: false |
| first_furi | string | null: false |
| first_furi | string | null: false |
| mail       | string | null: false |
| password   | string | null: false |
| nickname   | string | null: false |
| date       | date   | null: false |

has_many:products
has_one:information



## address テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postal_code | integer| null: false |
| city        | string | null: false |
| state_id    | integer| null: false |
| house_number| integer| null: false |
| telephone   | string | null: false |
| house_name  | string |             |

belongs_to:information

## information テーブル

| Column     | Type   | Options           |
| -----------| ------ | ------------------|
| user_id    | references| foreign_key: true |
| product_id | references| foreign_key: true |

has_one:address
belongs_to:users
belongs_to:products