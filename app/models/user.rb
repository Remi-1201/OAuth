class User < ApplicationRecord
  # deviseで許可するモジュールの設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable, omniauth_providers: %i(google)         
# ランダムなuidを作成するcreate_unique_stringメソッド
  def self.create_unique_string
    # SecureRandomクラスに用意されている、uuidメソッドを使用して、ランダムな文字列をつくり出します
    SecureRandom.uuid
  end

  def self.find_for_google(auth)
    # auth.info.emailが、OAuthで持ってきたユーザー情報であり、それをUserのemailカラムに入れて保存し、Userを作成しています
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.new(email: auth.info.email,
                      provider: auth.provider,
                      uid:      auth.uid,
                      password: Devise.friendly_token[0, 20],
                                 )
  end

  user.save
  user
end
end