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
| first_name_2        | string  | null: false |
| birthday            | data    | null: false |


### Association

- has_many :item
- has_many :order

## items テーブル

| Column       | Type         | Options                        |
| ------       | ------       | -----------                    |
| user         | references   | null: false, foreign_key: true |
| item_name    | string       | null: false                    |
| description  | text         | null: false                    |
| category_id  | integer      | null: false                    |
| status_id    | integer      | null: false                    |
| money_type_id| integer      | null: false                    |
| area_id      | integer      | null: false                    |
| send_day_id  | integer      | null: false                    |
| price        | integer      | null: false                    |

### Association

- belongs_to :user
- has_one :order

## order テーブル

| Column      | Type       | Options                        |
| ------      | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :send_user

## send_users テーブル

| Column            | Type       | Options                        |
| ------            | ------     | -----------                    |
| item              | references | null: false, foreign_key: true |
| area_id           | integer    | null: false                    |
| adress_number     | string     | null: false                    |
| city              | string     | null: false                    |
| house_number      | string     | null: false                    |
| building_name     | string     |                                |
| phone_number      | string     | null: false                    |


### Association

- belongs_to :order