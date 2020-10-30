# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ---------           | ------  | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name_1         | string  | null: false |
| first_name_1        | string  | null: false |
| last_name_2         | string  | null: false |
| birthday            | data    | null: false |


### Association

- has_many :selling_items
- has_many :sold_items

## seling_items テーブル

| Column       | Type         | Options                  |
| ------       | ------       | -----------                    |
| user         | preferences  | null: false, foreign_key: true |
| item_name    | preferences  | null: false, foreign_key: true |
| description  | text         | null: false                    |
| category     | integer      | null: false                    |
| status       | integer      | null: false                    |
| money_type   | integer      | null: false                    |
| area         | integer      | null: false                    |
| send_day     | integer      | null: false                    |
| price        | integer      | null: false                    |

### Association

- belongs_to :user
- has_one :sold_item

## sold_items テーブル

| Column            | Type       | Options                        |
| ------            | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :selling_item
- has_one :send_user

## send_users テーブル

| Column            | Type       | Options                        |
| ------            | ------     | -----------                    |
| user_id           | preferences| null: false, foreign_key: true |
| prefecture        | integer    | null: false                    |
| adress_number     | string     | null: false                    |
| city              | string     | null: false                    |
| house_number      | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |


### Association

- belongs_to :sold_item