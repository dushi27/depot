class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_filter :check_input, only:[:create, :update]
  
  def index
    @users = User.order(:name)
    
    respond_to do |format|
      format.html 
      format.xml { render xml: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render xml: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
      format.xml  { render xml: @user }
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to(users_path,
          notice: "User #{@user.name} was successfully created.") }
        format.xml  { render xml: @user,
          status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.xml  { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, notice: "User #{@user.name} was successfully updated.") }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xml: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted"
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end


  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confrimation)
    end   
             
end
