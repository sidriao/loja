# encoding: utf-8
class RolesController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Não autorizado como administrador'
    @roles = Role.paginate(:page => params[:page],
                               :per_page => 5,
                               :order => 'id DESC')
  end

  # GET /pessoas/1
  # GET /pessoas/1.json
  def show
    authorize! :show, @user, :message => 'Não autorizado como administrador'

    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # GET /pessoas/new
  # GET /pessoas/new.json
  def new
  	authorize! :new, @user, :message => 'Não autorizado como administrador'
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pessoa }
    end
  end

  # POST /pessoas
  # POST /pessoas.json
  def create
    authorize! :create, @user, :message => 'Não autorizado como administrador'

    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Regra Cadastrada com Sucesso.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /pessoas/1
  # DELETE /pessoas/1.json
  def destroy
    authorize! :destroy, @user, :message => 'Não autorizado como administrador'

    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
end
