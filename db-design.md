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
has many: user_badge
has many: plant

### User_badge
|Colum|type     |Options|memo|
|-    |-        |-    |-    |
|id   |integer  |-    |-   |
|type  |string  |null:false    |バッジの種類   |
|created_at  |datetime  |null:false    |バッジを取得した日   |

belongs_to user
belongs_to badge

### Badge
|Colum|type     |Options|memo|
|-    |-        |-    |-    |
|id   |integer  |-    |-   |
|name   |string  |null:false    |バッジの名前   |

has_many user_badge
 


### Plant
|Colum|type     |Options|memo|
|-    |-        |-    |-    |
|id   |integer  |-    |-   |
|plant_name   |string  |null:false    |植物の名前   |
|img  |string  |null:false   |植物の写真   |
belongs_to :user
has_many :growth_record

### Grouth_record
|Colum|type     |Options|memo|
|-    |-        |-    |-    |
|id   |integer  |-    |-   |
|record_time  |datetime  |null:false    |日時   |
|temp  |float  |null:false   |気温   |
|humid  |float  |null:false   |湿度   |
belongs_to :plant

### Comment
|Colum|type     |Options|memo|
|-    |-        |-    |-    |
|id   |integer  |-    |-   |
|record_time  |datetime  |null:false    |投稿日時   |
|user_name  |string  |null:false    |投稿者  |
|body  |text  |null:false   |本文   |

belongs_to :plant
ユーザー情報とどう紐づける？
