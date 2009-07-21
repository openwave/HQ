class WelcomeController < ApplicationController
  layout 'search'
  $business = 0
  def index

    @orgs = Org.find(:all)
    if params[:business] == 'true'
    $business = 1
    
    end
    if current_user
    @user_org = Org.find_by_user_id(current_user.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orgs }
    end
  end
end
