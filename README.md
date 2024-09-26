### Sniper Ballistic App

このアプリケーションは、陸上自衛隊のM24狙撃銃専用の弾道計算アプリです。ユーザーが入力した射撃データを基に、弾道の落下や水平偏差を計算し、詳細な射撃記録を管理できます。

---

### データベース設計

### Usersテーブル

| カラム名 | 型 | 説明 |
| --- | --- | --- |
| id | integer | 自動生成されるID |
| email | string | ユーザーのメールアドレス |
| encrypted_password | string | Deviseで管理される暗号化されたパスワード |
| created_at | datetime | レコード作成日時 |
| updated_at | datetime | レコード更新日時 |

---

### Ballisticsテーブル

| カラム名 | 型 | 説明 |
| --- | --- | --- |
| id | integer | 自動生成されるID |
| user_id | integer | ユーザーID（`users`テーブルとの関連付け） |
| weapon_id | integer | 使用された銃器のID（`weapons`テーブルとの関連付け） |
| distance | float | 射撃距離（メートル） |
| angle | float | 射撃角度（°） |
| wind_speed | float | 風速（mph、m/sに変換して保存） |
| wind_direction | float | 風向（°） |
| calculated_drop | float | 計算された弾道の落下距離（m） |
| calculated_dispersion | float | 計算された水平偏差（m） |
| location | string | 射撃場所 |
| weather | string | 天気（晴れ、曇り、雨、雪） |
| temperature | integer | 気温（℃） |
| humidity | integer | 湿度（%） |
| comments | text | 射撃に関する所感やコメント |
| first_shot_correction | float | CCB射撃による初弾の補正（今後の拡張機能） |
| created_at | datetime | レコード作成日時 |
| updated_at | datetime | レコード更新日時 |

---

### Weaponsテーブル

| カラム名 | 型 | 説明 |
| --- | --- | --- |
| id | integer | 自動生成されるID |
| user_id | integer | `users`テーブルとの関連 |
| serial_number | string | 銃のシリアル番号（銃番号） |
| name | string | 銃の名前（例：M24、レミントン700など） |
| caliber | string | 使用弾薬の口径（例：7.62mm x 51 NATO） |
| first_shot_deviation | float | CCB射撃の初弾補正（±の誤差を記録） |
| created_at | datetime | レコード作成日時 |
| updated_at | datetime | レコード更新日時 |

---

### Features

- 射撃距離、風速、風向、射撃角度を基に弾道計算を行う。
- 射撃データ（日時、場所、天気、気温、湿度、所感）を記録する。
- 複数の銃を管理し、銃ごとの射撃データを記録する（銃番号による管理）。
- 将来的には、CCB射撃の初弾補正機能を実装予定。
- ユーザーごとのデータを管理し、集計してパフォーマンスを分析可能。

---

### Usage

1. 射撃距離、風速、風向、射撃角度を入力。
2. 銃器の選択。
3. 射撃場所、天気、気温、湿度、所感などの追加情報を入力。
4. 記録されたデータに基づき、弾道の落下や水平偏差を計算。