class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def authenticate_user!
      redirect_to root_path, notice: "Cadastre-se ou faça login para continuar." unless user_signed_in?
    end
end
