class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :remove_cookbook_from_user,]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    cookbooks_list
  end

  # GET /users/1/edit
  def edit
    cookbooks_list
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if !params[:user][:cookbooks].nil?
      user_cookbooks
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update    
    if @user.update(user_params)
      user_cookbooks
      redirect_to @user, notice: 'profile was successfully updated.'
    else
      render action: 'edit' 
    end
  end

  def remove_cookbook_from_user
   UsersCookbook.find_by(:user_id =>params[:id], :cookbook_id => params[:cookbook_id]).destroy
   redirect_to @user, notice: 'cookbook was successfully removed.' 
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email,)
    end

    # Creates an array of all cookbooks
    def cookbooks_list
      @coobooks = Cookbook.all.collect { |p| [ p.name, p.id ]}
    end

    # Creates an array of User's cookbooks
    def user_cookbooks
       params[:user][:cookbooks].each do |cookbook_id|
        next if cookbook_id.to_i == 0
        cookbook = Cookbook.find(cookbook_id.to_i)
        @user.cookbooks << cookbook
      end
    end
end
