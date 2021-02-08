class NotificationMailer < ApplicationMailer
  default from: 'no-replay@gmail.com'  #？
  
  def complete_mail(user)
    @user = user
    attachments['Gemfile.txt'] = File.read('Gemfile')
    attachments['sample.html'] = File.read('app/views/sample/sample_text.html')
    mail(subject: "メールが届きましたぞよ", to: @user.email)  #subjectは、件名　toは宛先
  end

end
