class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  before_action :set_user,       only: [:show, :edit, :update, :destroy, :following, :followers]

  # List all users
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  # Show a specific user and their microposts
  def show
    @microposts = @user.microposts.paginate(page: params[:page])
    # Uncomment the next line to redirect inactive users:
    #redirect
    redirect_to root_url and return unless @user.activated?
  end

  # Sign-up form
  def new
    @user = User.new
  end

  # Create a new user
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  # Edit user profile
  def edit
  end

  # Update user profile
  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  # Delete a user
  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url, status: :see_other
  end

  # Show the users that this user is following
  def following
    @title = "Following"
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  # Show the users that are following this user
  def followers
    @title = "Followers"
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  # Strong parameters for user creation and updates
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # Ensure user is logged in
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url, status: :see_other
    end
  end

  # Ensure the correct user is accessing/editing their data
  def correct_user
    redirect_to(root_url, status: :see_other) unless current_user?(@user)
  end

  # Ensure only admins can delete users
  def admin_user
    redirect_to(root_url, status: :see_other) unless current_user.admin?
  end

  # Fetch the user by ID or redirect if not found
  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:danger] = "User not found."
      redirect_to root_url
    end
  end

end