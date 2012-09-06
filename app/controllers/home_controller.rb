class HomeController < ApplicationController

  def index
  end

  def index_autenticado
    @users = User.all
  end
end
