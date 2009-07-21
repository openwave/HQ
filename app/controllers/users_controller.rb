class UsersController < ApplicationController
  layout 'search'
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]


  def new
    @user = User.new
   
  end

  
  def create
    @user = User.new(params[:user])
    @usr=User.new()
         unless @user.valid?
               @user.errors.each {|k,v| @usr.errors.add(k, v) }
         end
                      
    if @user.save
      #flash[:notice] = "Account registered!"
      redirect_to :controller => :welcome,:action=>:index
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      #flash[:notice] = "Account updated!"
      redirect_to :controller => :welcome,:action=>:index
    else
      render :action => :edit
    end
  end
end

def new_user_session
    @user_session = UserSession.new
  end

  def create_user_session
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      #flash[:notice] = "Login successful!"
      redirect_to root_url
    else
      render :action => :new
    end
  end

  def destroy_user_session
    current_user_session.destroy
    #flash[:notice] = "Logout successful!"
    redirect_back_or_default root_url
  end