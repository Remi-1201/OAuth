class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    @user = User.find_for_google(request.env['omniauth.auth'])
    # 以上のコードは、googleからomniauthで取得した情報にrequest.env['omniauth.auth']のハッシュでアクセスできるものです。

    # @user.persisted?の記述で有効なユーザーが存在するかを確認しています。
    if @user.persisted?
      # 有効なユーザーとして確認できると、deviseに用意されているsign_in_and_redirectメソッドでサインインできます。
      sign_in_and_redirect @user, event: :authentication
      # フラッシュメッセージを表示させるメソッドです。記述してもしなくてもログイン自体は問題なく動作します。
      set_flash_message(:notice, :success, kind: "google") if is_navigational_format?
    else
      # ユーザーがサイトから存在しなくなると、Omniauthのデーターをセッションに保存する処理が流れます。
      session['devise.google_data'] = request.env['omniauth.auth']
      # そしてユーザーを登録フォームへとリダイレクトさせています。
      redirect_to new_user_registration_url
    end
  end
end