class ProfessionalUsersController < ApplicationController
  before_action :set_professional_user, only: [:show, :edit, :update, :destroy]

  # GET /professional_users
  # GET /professional_users.json
  def index
    @professional_users = ProfessionalUser.all
  end

  # GET /professional_users/1
  # GET /professional_users/1.json
  def show
    require_logged_in_user

    @professional_user = ProfessionalUser.find(params[:id])

    if current_user.id != @professional_user.id
      redirect_to current_user
    end
  end

  # GET /professional_users/new
  def new
    @professional_user = ProfessionalUser.new
  end

  # GET /professional_users/1/edit
  def edit
    @professional_user = current_user
  end

  def update
      @professional_user = current_user
      if @professional_user.update(professional_user_params)
        flash.now[:success] = 'Informações alteradas com sucesso!'
        render :edit
      else
        render :edit
      end
  end
  # POST /professional_users
  # POST /professional_users.json
  def create
    @professional_user = ProfessionalUser.new(professional_user_params)


      if @professional_user.save
        flash[:success] = 'Usuário cadastrado com sucesso.'
        redirect_to root_path
      else
        render :new

      end
    end
  end

  # PATCH/PUT /professional_users/1
  # PATCH/PUT /professional_users/1.json


  # DELETE /professional_users/1
  # DELETE /professional_users/1.json
  def destroy
    @professional_user.destroy
    respond_to do |format|
      format.html { redirect_to professional_users_url, notice: 'Conta excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_user
      @professional_user = ProfessionalUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_user_params
      params.require(:professional_user).permit(:name, :email, :phone, :profession, :document, :description, :facebook, :instagram, :password, :password_confirmation, :avatar)
    end

