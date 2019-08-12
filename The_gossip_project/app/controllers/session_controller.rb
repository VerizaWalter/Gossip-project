class SessionController < ApplicationController
  before_action :valid_user, only: [:destroy]
  def index

  end

  def create
    user = User.find_by(email: params[:email])
  
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = 'Connexion réussi'
      redirect_to gossips_path
  
    else
      flash.now[:danger] = 'Invalid email/password combination'
    end
  end


  def destroy
    session.delete(:user_id)
    flash[:success] = 'Deconnexion réussi'
    redirect_to gossips_path
  end
  
end