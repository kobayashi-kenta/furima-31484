# テーブル設計

## users テーブル

| Column     | Type    | Options     |
| ---------  | ------  | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| last_name  | string  | null: false |
| first_name | string  | null: false |
| b_year     | integer | null: false |
| b_month    | integer | null: false |
| b_day      | integer | null: false |

### Association

- has_many :selling_items
- has_many :sold_items

## seling_items テーブル

| Column       | Type        | Options                  |
| ------       | ------      | -----------                    |
| user_id      | preferences | null: false, foreign_key: true |
| category     | string      | null: false                    |
| send_money   | string      | null: false                    |
| area         | string      | null: false                    |
| send_day     | string      | null: false                    |

### Association

- belongs_to :user
- has_one :sold_item

## sold_items テーブル

| Column            | Type       | Options                        |
| ------            | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true |
| good_id           | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :selling_item
- has_one :send_user

## send_users テーブル

| Column            | Type       | Options                        |
| ------            | ------     | -----------                    |
| user_id           | preferences| null: false, foreign_key: true |
| card_number       | integer    | null: false                    |
| security_cord     | integer    | null: false                    |
| expiration_date   | integer    | null: false                    |
| number            | integer    | null: false                    |
| prefecture        | ActiveHash | null: false                    |
| city              | string     | null: false                    |
| house_number      | integer    | null: false                    |
| building_name     | string     |                                |
| phone_number      | integer    | null: false                    |


### Association

- belongs_to :sold_item
- belongs_to :user, trough: sold_items
