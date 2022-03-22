class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash={})
    # uidにランダムなuidを代入
    hash[:uid] = User.create_unique_string
    # superメソッドを使用して、もとのメソッドに記述されていたものを、そのまま代入
    super
  end
end