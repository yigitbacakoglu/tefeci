class UserMailer < ActionMailer::Base
  default :from => "tefecidefteri@gmail.com"
  def credit_confirmation(friend)
  	@friend=friend
  	
  	@credits=Credit.find_all_by_friend_id(@friend.id)
@users=User.find_by_uid("67595179")
  	mail(:to => friend.email, :subject => "Borcunu Hatirlatirim" )
  end
end
