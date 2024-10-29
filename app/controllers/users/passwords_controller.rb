# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
  
    if successfully_sent?(resource)
      redirect_to after_sending_reset_password_instructions_path_for(resource_name)
    else
      flash[:alert] = "メールアドレスを確認してください" if is_navigational_format?
      render :new # もしくは、適切なテンプレートを表示
    end
  end

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
  
    # パスワード更新が成功した場合、ログインする
    if resource.errors.empty?
      flash[:success] = "パスワードが変更されました" if is_navigational_format?
      sign_in(resource_name, resource) # 自動的にログインする場合
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      # 入力エラーの場合、エラーメッセージを設定
      flash[:alert] = "パスワードを確認してください" if is_navigational_format?
      respond_with resource
    end
  end
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
