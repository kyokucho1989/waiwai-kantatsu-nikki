# データベース設計

## いきりなりDB設計を考えるのはしんどい
　このサービスに必要なものから考えてみる

#### 通常ユーザー
- ログインID（メールアドレス）
- ユーザー名（あとから変更可能）
- ログインPass
- 取得したバッジの種類

#### 管理者
- 管理用ID
- 管理用Pass

#### 植物
- 植物名
- 植物名用の画像データ
- 観察日時
- 温度
- 湿度

#### 投稿するコメント
　どんな情報になるんだ？？

---

## DBのテーブル
### User
|Colum|type     |Options|memo|
|-    |-        |-    |-    |
|id   |integer  |-    |-   |
|login_id   |string  |null:false    |ログインID   |
|user_name  |string  |null:false    |名前   |
|password  |string  |null:false   |パスワード   |
取得したバッジ数はどこにデータをつくる？どんなデータ？
（後々実装する内容だけど、いまから決めておきたい）

### Plant
|Colum|type     |Options|memo|
|-    |-        |-    |-    |
|id   |integer  |-    |-   |
|plant_name   |string  |null:false    |植物の名前   |
|planted_person  |string  |null:false    |作成した人   |
|img  |???  |null:false   |植物の写真   |

作成した人はユーザーと紐付けたい
温度・湿度・観察日時のようにあとで増える項目はどこにおけばいいのか
