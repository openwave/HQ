# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def rating_links(org)
    average = (org.rating_average.blank? ? 0 : org.rating_average) * 100 / 5

    html = "<ul class='stars'>"
    html += "<li class='current_rating' style='width: #{average}%'>#{average}%</li>"
    if(!org.rated?)
      html += "<li>#{link_to_remote "One", :update => "org_rating_#{org.id}", :url => rate_org_path(org, :rating => 1), :html => {:class => "one_star"}, :method => :put}</li>"
      html += "<li>#{link_to_remote "Two", :update => "org_rating_#{org.id}", :url => rate_org_path(org, :rating => 2), :html => {:class => "two_stars"}, :method => :put}</li>"
      html += "<li>#{link_to_remote "Three", :update => "org_rating_#{org.id}", :url => rate_org_path(org, :rating => 3), :html => {:class => "three_stars"}, :method => :put}</li>"
      html += "<li>#{link_to_remote "Four", :update => "org_rating_#{org.id}", :url => rate_org_path(org, :rating => 4), :html => {:class => "four_stars"}, :method => :put}</li>"
      html += "<li>#{link_to_remote "Five", :update => "org_rating_#{org.id}", :url => rate_org_path(org, :rating => 5), :html => {:class => "five_stars"}, :method => :put}</li>"
    end
    html += "</ul>"
    html
end
end
