Rails.application.routes.draw do
  root to: 'oauth_test#index'
  # 新規登録する際に、継承したregistration_controllerが使用されるようにします。
  devise_for :users, controllers: {
    registrations: "users/registrations",
    # これはgoogle認証された際のcallback URLを指定しています。
    # callback URLとは、APIで、OAuth認証後にリダイレクトされるURLのことです。
    omniauth_callbacks: "users/omniauth_callbacks"
  }
end
