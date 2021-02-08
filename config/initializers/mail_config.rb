ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',  #smtpメールサーバーの指定
  domain: 'gmail.com',        #ドメイン指定
  port: 587,                  #smtpメールサーバーのポート番号
  user_name: 'aoyamakaiwork@gmail.com',   #	メールサーバー認証用のユーザー名
  password: 'ipfardzltmgostrk',                   #メールサーバー認証用のパスワード
  authentication: 'plain',                #パスワードを平文で送信
  enable_starttls_auto: true              #	SMTPサーバーでSTARTTLSが有効であれば有効にする機能
}