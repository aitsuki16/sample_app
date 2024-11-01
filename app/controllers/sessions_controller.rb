class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      reset_session
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      # Create an error message.
      
      render 'new', status: :unprocessable_entity
    end # This 'end' closes the 'if' statement
  end

  def destroy
  end
end
