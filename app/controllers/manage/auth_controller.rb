class Manage::AuthController < Manage::BaseController
  layout 'auth'
  skip_before_filter :authorize

  def index
     session[:admin] = nil
    render :action => 'login' unless login
  end

  def login
    unless request.get?
      if try_login(params[:login], params[:password])
        session[:admin] = true
        redirect_to(params[:request_uri].blank? ? '/manage' : params[:request_uri])
        return true
      else
        flash[:notice] = 'Неверный логин/пароль'
       end
    end

    false
  end

  def logout
    reset_session     # полное удаление всего содержимого старой сессии и инициализация новой сессии

    flash[:notice] = 'До свидания!'
    redirect_to :action => 'login'
  end

end
