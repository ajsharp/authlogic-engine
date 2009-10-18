class User < ActiveRecord::Base
  
  acts_as_authentic do |u|
    u.validate_email_field
    u.validate_login_field false
  end
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserNotifier.deliver_password_reset_instructions(self)  
  end
  
end
