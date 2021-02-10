class Batch::MailGo
  def self.mail_go
    NotificationMailer.all_mail.deliver_now
  end
end

