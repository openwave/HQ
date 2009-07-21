class RequestMailer < ActionMailer::Base
  protected
  
    def contact_mail_org(org,user,contact,admin)
    @recipients = admin.email
    @from = "mailer.wts@gmx.com"
    @subject = user.first_name + ' ' + 'has sent you a message'
    @sent_on = Time.now
    @body[:user] = user
    @body[:contact] = contact
    @body[:admin] = admin
  end
  
    def contact_mail_user(org,user,contact,admin)
    @recipients = user.email
    @from = "mailer.wts@gmx.com"
    @subject = 'Your email has been sent to'+ ' ' + admin.first_name + ' ' + 'at' + ' '  + Time.now.to_s
    @sent_on = Time.now
    @body[:url] = "I did not hear back from this organization."
    @body[:user] = user
    @body[:admin] = admin
    end
  
    def send_request(video_request)
    @recipients = "santhosh6265@gmail.com"
    @from = "mailer.wts@gmx.com"
    @subject = "Request for video creation"
    @sent_on = Time.now
    @body = video_request.content
    end

    def send_report(review_report,review)
    @recipients = "santhosh6265@gmail.com"
    @from = "mailer.wts@gmx.com"
    @subject = 'Report regarding the review written by' + review.name + '(' + review.id.to_s + ')'
    @sent_on = Time.now
    @body = review_report.content
    end
end