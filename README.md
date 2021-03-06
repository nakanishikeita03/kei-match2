# Go-En

駆け出しエンジニアが日々の学習内容の共有ができ、コミュニケーションが取れるwebサービスです。

<img width="1271" alt="スクリーンショット 2019-10-26 13 15 10" src="https://user-images.githubusercontent.com/53807858/67614194-b65a5e00-f7f3-11e9-88c0-dc7ddebeb411.png">

# リンク

https://go-en-jp.com

# テストユーザー

email: test@go-en-jp.com

password: password

- ログイン画面の**テストユーザーでログイン**をクリックしていただくと簡単です。

# このサービスでできること
- 学習内容の投稿ができる

![go-en投稿 mp4](https://user-images.githubusercontent.com/53807858/68015018-781ddc80-fcd4-11e9-8369-8fa5760a1142.gif)

- 他ユーザーの投稿の閲覧ができる

![go-enフォロー mp4](https://user-images.githubusercontent.com/53807858/68015016-781ddc80-fcd4-11e9-9df5-2c08966e676c.gif)

- 相互フォローしたユーザーとメッセージができる

![go-enメッセージ mp4](https://user-images.githubusercontent.com/53807858/68015017-781ddc80-fcd4-11e9-97b3-c9db5d8ad492.gif)

# 特に見ていただきたい点

- Bootstrapとメディアクエリを活用したレスポンシブ対応
- jQueryを用いた動的アニメーション/ajax通信の実装(インクリメンタルサーチ/メッセージ自動更新)
- 外部APIを利用したログイン機能
- CircleCIとGitHubを連携させて自動テスト、gem selenium-webdriver/ChromeDriverを用いてのブラウザでテスト
- インフラ周り(AWSを使用/Capistranoによる自動デプロイ/ELBをエンドポイントとする常時SSL化/画像データ保存でクラウドストレージS3を使用)

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
  - ユーザー検索機能(ajax通信での非同期検索(インクリメンタルサーチ))
  - 他ユーザーへのフォロー機能
  - いいね機能
  - 不適切用語のフィルター(gem Antivirusを使用)
  - 単体テスト(RSpec,cicleCIを用いた動作確認,gem Simplecovでのカバレッジ計測)
  - 統合テスト(外部APIを利用した機能のテスト(モックの使用),gem selenium-webdriver/ChromeDriverを用いたブラウザテスト)

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
- CircleCI

# クラウドアーキテクチャ

![go-enインフラ](https://user-images.githubusercontent.com/53807858/67618575-31d80180-f82c-11e9-9449-4d9d95dd5c27.png)

**EC2インスタンスにCapistranoを用いて、ローカル環境からコマンド一つで自動デプロイを行うようにしています。**
**またCertificate ManagerでSSLサーバ証明書を発行し、お名前.comで取得したドメインをRoute53/ELBで常時SSL化しています。**

**クラウドストレージにはS3を採用しました。**

GitHub上では可視化されませんが、AWSではVPC内のセキュリティグループやIAMユーザーポリシーなどの設定を行い、実際の現場でのアーキテクチャを想定して構成されています。

尚、アプリ内の秘匿情報等はRailsのseacretsを活用し、keyとidを本番環境の環境変数に登録することで管理しています。

# RSpec/CircleCI

![go-enfeatureテスト mp4](https://user-images.githubusercontent.com/53807858/68014109-fe84ef00-fcd1-11e9-8aea-21cbd22c2aac.gif)

単体テストはRSpecを使用しました。gem factory_botやbefore/letメソッドの使用でなるべく少ないコードで機能をテストすることを心がけました。
gem simplecovでのカバレッジ計測を行なっています。

統合テストはモックを使用し、外部APIを利用した機能のテストの作成。**gem selenium-webdriver/ChromeDriverを用いてブラウザでテストしています。**

**またCircleCIを用いてRSpecでのアプリケーション動作確認**を行なっています。CircleCIの設定は[.ciecleci/config.yml](https://github.com/nakanishikeita03/kei-match2/blob/master/.circleci/config.yml)を見て頂けるとわかるかと思います。
最終的なテスト時間は以下の通りです。

<img width="1353" alt="スクリーンショット 2019-11-07 12 49 25" src="https://user-images.githubusercontent.com/53807858/68358900-505bc800-015d-11ea-95b9-29ee65bdb8cc.png">
