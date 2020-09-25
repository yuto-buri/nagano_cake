# ながのCAKE

無題14 2.jpg

⻑野県にある⼩さな洋菓⼦店「ながのCAKE」の商品を通販するためのECサイトです。

## 案件の背景

元々近隣住⺠が顧客だったが、昨年始めたInstagramから⼈気となり、全国から注⽂が来るようになりました。
InstagramのDMやメールで通販の注⽂を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い⾄りました。

## 通販について

- 通販では注⽂に応じて製作する受注⽣産型としています。
- 現在通販での注⽂量は⼗分に対応可能な量のため、1⽇の受注量に制限は設けません。
- 送料は1配送につき全国⼀律800円です。
- 友⼈や家族へのプレゼントなど、注⽂者の住所以外にも商品を発送できます。
- ⽀払⽅法はクレジットカード、銀⾏振込から選択できます。

## 用語の定義

### 顧客
- ながのCAKEの商品を購⼊する⼈（客）

### 会員
- ECサイトにユーザー登録している顧客

### ECサイト
- 顧客が利⽤するサイト

### 管理サイト
- 店で働く事務員・パティシエ等が利⽤するサイト（管理者⽤サイト）

### 注文ステータス
- 注⽂の状態遷移を表す（後述）。

### 製作ステータス
- 注⽂に紐付く注⽂商品の状態遷移を表す（後述）。

### 販売ステータス
- 商品の販売状況を表す。現状、販売中、売切れの2パターンがある。
  - 販売停⽌商品は「売切れ」をセットする。

### 会員ステータス
- 現状、有効・退会の2パターンがある。

### ジャンル
- 商品の種類。
  - 現状、ケーキ、プリン、焼き菓⼦、キャンディの4ジャンルある。

### 注文個数
- 1回の注⽂に紐付く注⽂個数の合計。
  - 例）商品Aを3個、商品Bを2個注⽂→注⽂個数は5。

### 商品小計
- 商品単価（税込）×個数
  - 例）1,200円（税込）の商品を2個購⼊＝商品⼩計は2,400円
 
 
## 実装機能/使用方法
### Customer（顧客側）
- 顧客は会員登録、ログイン・ログアウト、退会ができます。
- 会員のログインはメールアドレスとパスワードで⾏います。
- 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表⽰するなどして判断できるようにしています。
- サイトの閲覧はログインなしで⾏えます。
- 商品をカートに⼊れ、1度に複数種類、複数商品の購⼊ができます。また、カート内の商品は個数変更・削除ができます。
- カートへの商品追加はログインなしでは⾏えません。
- クレジットカード情報はシステム上保持していません。
- 会員はマイページからユーザ情報の閲覧・編集、注⽂履歴の閲覧、配送先の閲覧・編集ができます。
- 注⽂履歴⼀覧には下記の情報が表⽰されます。
  - 注⽂⽇
  - 配送先
  - ⽀払⾦額（商品合計＋送料）
  - 注⽂ステータス
- 注⽂履歴詳細には下記の情報が表⽰されます。
  - 注⽂⽇
  - 配送先
  - ⽀払⽅法
  - 注⽂ステータス
  - 商品の注⽂内容詳細（商品名、単価、個数、⼩計）
  - 請求情報（商品合計、送料、⽀払⾦額）
-  会員登録時、下記の情報をユーザ情報として⼊⼒できます。
  - 名前（姓・名）
  - 名前（カナ姓・カナ名）
  - 郵便番号
  - 住所
  - 電話番号
  - メールアドレス
  - パスワード
- 商品は税込価格で表⽰されます。

### Admin（店側）
- 管理者⽤メールアドレスとパスワードでログインできます。（管理者⽤メールアドレスとパスワードは事前にデータベースへ登録をお願い致します）
- 商品の新規追加、編集、販売停⽌（売切表⽰）が⾏えます。
- 商品情報は下記のものを持っております。
  - 商品名
  - 商品説明⽂
  - ジャンル
  - 税抜価格
  - 商品画像
  - 販売ステータス
- 会員登録されているユーザ情報の閲覧、編集、退会処理が⾏えます。
- ユーザの注⽂履歴が⼀覧・詳細表⽰できます。
- 注⽂履歴には注⽂ごとに下記の情報が表⽰されます。
  - 購⼊者
  - 購⼊⽇
  - 購⼊内容
  - 請求額合計
  - 配送先
  - 注⽂ステータス
  - 各注⽂商品の製作ステータス
- 注⽂ステータス、製作ステータスの更新ができます。
- 商品ジャンルには「有効」「無効」を設定できます。無効に設定したジャンルは、ジャンル⼀覧に表⽰されません。また、無効になっているジャンルに紐付く商品も表⽰されません。
- ヘッダには商品検索窓を配置しております。

## 使用言語

- HTML
- CSS
- Ruby
- フレームワーク
  - Ruby on Rails
  
## Gem

- device
- refile
- refile-mini-magick
- bootstrap-sass
- jquery-rails
- kaminari
- nokogiri
- pry-rails
- enum_help

## 作成者
#### ゆとブリ
- 本木拓海（https://github.com/takumimo）
- 松尾侑宇大（https://github.com/matsuoyudai）
- 下地貴大（https://github.com/takahiro0426）
- 村田茜（https://github.com/mumumu330）
