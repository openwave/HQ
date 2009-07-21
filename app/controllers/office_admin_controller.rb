class OfficeAdminController < ApplicationController
  layout 'office_admin'
  def orgs_list
    @orgs = Org.find(:all,:include => :videos)
  end
  def videos_list
    @org = Org.find(params[:id],:include => :videos)
    @videos = @org.videos
  end
  def show_video
 @video = Video.find(params[:id])
  end
  def accept
   @v = Video.find(params[:id])
    @v.approve = 1
    @v.save
    org_id = @v.org_id
    @org = Org.find(org_id)
    @videos = @org.videos
    render :template => '/office_admin/videos_list'
  end
    def decline
    @v = Video.find(params[:id])
    @v.approve = 0
    @v.save
    org_id = @v.org_id
    @org = Org.find(org_id)
    @videos = @org.videos
    render :template => '/office_admin/videos_list'
  end


end
