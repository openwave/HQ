ActionController::Routing::Routes.draw do |map|
  
  map.resources :users, :has_many => [:orgs]
  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :password_resets
  map.login_signup 'login_signup', :controller => 'login_signup', :action=>'index'
  map.resources :orgs,:collection => { :rate => :put }, :has_many => [:flowings, :facts, :prices, :tabs, :highlights, :galleries, :deals, :events, :notifications, :contacts]
  map.resources :facts  
  map.resources :flowings
  map.resources :prices
  map.resources :highlights
  map.resources :galleries, :has_many => [:photos]
  map.resources :tabs, :collection => { :sort => :post }  
  map.resources :deals, :collection => { :sort => :post }
  map.resources :office_admin
  map.resources :photos
  map.resources :events
  map.resources :notifications
  map.resources :contacts
  map.resources :videos  
  map.root :controller => "welcome"
  
  
  map.search 'search', :controller=>'comps', :action=>'search'
  map.search1 'myHQadmin_bulletedList', :controller=>'highlights', :action=>'bulletedLists'
  map.search2 'myHQpage_contact', :controller=>'comps', :action=>'contact'
  map.search3 'myHQadmin_flowingText', :controller=>'comps', :action=>'flowingText'
  map.search4 'myHQpage_highlights', :controller=>'comps', :action=>'highlights'
  map.search5 'myHQpage_login', :controller=>'comps', :action=>'login'
  map.search6 'myHQpage_menu', :controller=>'comps', :action=>'menu'
  map.search7 'myHQpage_notification', :controller=>'comps', :action=>'notification'
  map.search8 'myHQadmin_personalInfo', :controller=>'comps', :action=>'personalInfo'
   map.search9 'myHQadmin_preview', :controller=>'comps', :action=>'preview'
  map.search10 'myHQadmin_priceDescription', :controller=>'comps', :action=>'priceDescription'
  map.search11 'myHQpage_profile', :controller=>'comps', :action=>'profile'
  map.search12 'myHQpage_userReviews', :controller=>'comps', :action=>'userReviews'
  map.search13 'myHQpage_writeAReview', :controller=>'comps', :action=>'myHQpage_Write_a_Review'
  map.writereview 'writereview', :controller=>'orgs', :action=>'myHQpage_Write_a_Review'
  map.flowtext 'flowtext',:controller=>'haml',:action=>'myHQadmin_flowing_text'
  map.manageHQCard 'manageHQCard',:controller=>'deals',:action=>'manageHQCard'
  map.card_deal 'manageHQCard',:controller=>'deals',:action=>'manageHQCard'
  map.office 'office',:controller => 'office_admin',:action => 'orgs_list'
  map.sales_calendar_example 'sales',:controller=>'events',:action=>'index'
  map.bulleted_lists 'bulleted_lists',:controller=>'highlights',:action=>'myHQpage_admin_bulleted_lists'
  map.price_description_admin 'myHQpage_price_description' ,:controller=>'prices',:action=>'myHQpage_price_description'
  # map.new_notifications 'org/:id/notifications/new', :controller => 'notifications', :action=>'new'
  # map.new_contacts 'org/:id/contacts/new', :controller => 'contacts', :action=>'new'
  
  # Install the default routes as the lowest priority.
    map.org ':title/:id' , :controller => 'haml',:action => 'myHQpage_admin'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
