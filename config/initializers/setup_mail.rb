ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587, # 465 or 587
  :domain               => "gmail.com",
  :user_name            => "rails123456@gmail.com",
  :password             => "gm123456",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
