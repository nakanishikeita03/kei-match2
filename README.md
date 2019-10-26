# Go-En
駆け出しエンジニアが日々の学習内容の共有ができる、コミュニケーションが取れるwebサービスです。
<img width="1271" alt="スクリーンショット 2019-10-26 13 15 10" src="https://user-images.githubusercontent.com/53807858/67614194-b65a5e00-f7f3-11e9-88c0-dc7ddebeb411.png">

# リンク
https://go-en-jp.com

# テストユーザー
email:test@go-en-jp.com
password:password

# このサービスでできること
- 学習内容の投稿ができる

![go-en投稿 mov](https://user-images.githubusercontent.com/53807858/67615007-a34e8a80-f801-11e9-852f-31b913211d0f.gif)

- 他ユーザーの投稿の閲覧ができる

![go-enフォロー mov](https://user-images.githubusercontent.com/53807858/67616024-abf98d80-f80e-11e9-92d0-5645dd84a06e.gif)

- 相互フォローしたユーザーとメッセージができる

![go-enメッセージ mov](https://user-images.githubusercontent.com/53807858/67615964-a8b1d200-f80d-11e9-963b-c1f0129359c5.gif)

# 特に見ていただきたい点
- インフラ周り(AWSを使用/Capistranoによる自動デプロイ/ELBをエンドポイントとする常時SSL化/画像データ保存でクラウドストレージS3を使用)
- 外部APIを利用したログイン機能
- Bootstrapとメディアクエリを活用したレスポンシブ対応

# 機能ならびに使用技術
- フロントエンド
  - Haml/Sassでのマークアップ
  - jQueryを用いた動的アニメーション/ajax通信の実装
  - Bootstrapとメディアクエリを活用したレスポンシブ対応
- サーバーサイド
  - ユーザー登録(/編集)機能(gem Deviseを使用)
  - ユーザー画像の登録機能 (gem Carrierwaveを使用)
  - Twitter/Facebook/Googleアカウントでのログイン機能(gem OmniAuthを利用)
  - 学習内容投稿(/削除)機能
  - 学習時間の可視化(gem Chartkickを使用)
  - 相互フォローユーザーとのメッセージ機能
  - ユーザー検索機能(ajax通信での非同期検索)
  - 他ユーザーへのフォロー機能
  - いいね機能
  - 不適切用語のフィルター(gem Antivirusを使用)
  - 単体テスト(Rspec)
- インフラ
  - CapistranoによるEC2インスタンスへの自動デプロイ
  - お名前.comで独自ドメインを取得後、Route53/ELB/Certificate Managerを用いて常時SSL化
  - S3を用いた画像データのクラウドストレージ保存

# 使用技術一覧
- Ruby 2.5.1
- Ruby on Rails 5.0.7
- MySQL 5.6.43
- Haml 5.1.2
- Sass 3.7.4
- jQuery 4.3.5
- Rspec 3.9
- AWS
  - EC2
  - ELB
  - S3
  - Route53
  - Certificate Manager
- Github