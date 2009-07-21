class Video < ActiveRecord::Base
  belongs_to :org
 has_attached_file :video
   
  # Paperclip Validations
  validates_attachment_presence :video
  validates_attachment_content_type :video, :content_type => ['video/x-msvideo','video/avi','video/quicktime','video/3gpp','video/x-ms-wmv','video/mp4','video/flv','video/mpeg','video/mpeg4','video/x-la-asf','video/x-ms-asf']
  # Acts as State Machine
  # http://elitists.textdriven.com/svn/plugins/acts_as_state_machine
  acts_as_state_machine :initial => :pending
  state :pending
  state :converting
  state :converted, :enter => :set_new_filename
  state :error

  event :convert do
    transitions :from => :pending, :to => :converting
  end

  event :converted do
    transitions :from => :converting, :to => :converted
  end

  event :failed do
    transitions :from => :converting, :to => :error
  end


# This method is called from the controller and takes care of the converting
  def convert
    self.convert!
    success = system(convert_command)
    if success && $?.exitstatus == 0
      self.converted!
    else
      self.failed!
    end
  end

  protected

  # This method creates the ffmpeg command that we'll be using
   def convert_command
     flv = File.join(File.dirname(video.path), "#{id}.flv")
     img = File.join(File.dirname(video.path), "#{id}.jpg")
     img1=File.join(File.dirname(video.path),"test.jpg")
     img2=File.join(File.dirname(video.path),"test-1.jpg")
     img3=File.join(File.dirname(video.path),"test-2.jpg")
   #  img4=File.join(File.dirname(video.path),"test-3.jpg")
     
    File.open(flv, 'w')
 
     # linux ffmpeg, can't convert 3gp with sound    
     # -ar 22050 -ab 32 -acodec mp3
     # command = <<-end_command
     #   /usr/bin/ffmpeg -i #{ video.path }  -ar 22050  
     #   -s 480x360 -vcodec flv  -qscale 1 -f flv -y #{ flv }
     # end_command
  
     # wine TVCC.exe , expensive
    # command = <<-end_command
    #   /usr/bin/wine /root/TVCC/TVCC.exe -vs 480x360 -vb 1000 -f #{ video.path } -o #{ flv } -thumbnail "-fo <#{ img }> -t 0:00:01 -s 240x180"
    # end_command
    # command.gsub!(/\s+/, " ")
  
     # Pazera over WINE
     command = <<-end_command
        ffmpeg  -y -i #{ video.path } -ar 22050 -s 480x360 -qscale 5 -f flv #{ flv };
        ffmpeg  -y -i #{ video.path }  -s 140x180  -f mjpeg -ss 0.001 -vframes 1 -an #{img};
        ffmpeg  -ss 3 -i #{ video.path }  -s 100x130  -f mjpeg  -an #{img1};
        ffmpeg  -ss 7 -i #{ video.path }  -s 100x130  -f mjpeg  -an #{img2};
        ffmpeg  -ss 10 -i #{ video.path }  -s 100x130  -f mjpeg  -an #{img3};
           
     end_command
    
     command.gsub!(/\s+/, " ")
     
   end

  # This update the stored filename with the new flash video file
  def set_new_filename
    update_attribute(:video_file_name, "#{id}.flv")
  end


end

         

