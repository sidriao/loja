class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Não autorizado como administrador'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
