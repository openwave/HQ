class UserSessionsController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  layout 'search'
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    @usr=UserSession.new()
         unless @user_session.valid?
               @user_session.errors.each {|k,v| @usr.errors.add(k, v) }
         end
    if @user_session.save
      #flash[:notice] = "Login successful!"
    @event_vote = Array.new
    @review_vote = Array.new
    @deal_vote = Array.new
      session[:event_votes]= @event_vote
      session[:review_votes]=@review_vote
      session[:deal_votes]=@deal_vote
      redirect_to :controller => :welcome,:action=>:index
    else
      render :action => :new
    end
  end

  def destroy
    session[:event_votes]=nil
    session[:deal_votes]=nil
    session[:review_votes]=nil
    
    

    current_user_session.destroy
    current_user = nil
    cookies.delete :password
    #flash[:notice] = "Logout successful!"
    #redirect_back_or_default root_url
    redirect_to :controller => :welcome,:action => :index
  end
    
end