 class CustomFailure < Devise::FailureApp
    def redirect_url
       new_user_session_url(:subdomain => 'secure')
    end

    def respond
      if http_auth?
        http_auth
      else
        flash[:notice] = "Falha na autenticação."
        redirect_to root_path
      end
    end
  end