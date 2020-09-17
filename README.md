# テーブル設計

## products テーブル

| Column        | Type   | Options     |
| --------------| ------ | ----------- |
| product_name  | string | null: false |
| image         | string | null: false |
| price         | integer| null: false |
| text          | string | null: false | 
| user_id       | integer| null: false |  
| category      | string | null: false |

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
| date       | integer| null: false |

has_many:products



## address テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postal_code | string | null: false |
| city        | string | null: false |
| state       | string | null: false |
| house_number| integer| null: false |
| telephone   | string | null: false |
| house_name  | string |             |

## information テーブル

| Column     | Type   | Options           |
| -----------| ------ | ------------------|
| user_id    | integer| foreign_key: true |
| product_id | integer| foreign_key: true |

has_one:address
belongs_to:users