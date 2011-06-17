class Manage::BaseController < ApplicationController
  layout 'manage'
  before_filter :authorize

  def initialize
    filecfg  = "#{RAILS_ROOT}/config/manage.yml"
    if filecfg && File.exists?(filecfg)
      @cfg = File.open(filecfg) { |file| YAML.load(file) }
    end
    @cfg ||= Hash.new
  end

  def index
  end

private
  def authorize
    unless session[:admin]
      flash[:notice] = 'Пожалуйста, войдите в систему'
      flash[:request_uri] = request.request_uri
      redirect_to :controller => '/manage/auth', :action => 'index'
    end
  end

  def try_login (username, password)
    username == @cfg['login'].to_s and password == @cfg['password'].to_s
  end

  def logout
  end
end
