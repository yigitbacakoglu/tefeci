class UserMailer < ActionMailer::Base
  default :from => "tefecidefteri@gmail.com"
  def credit_confirmation(friend)
  	@friend=friend
  	@users=User.find_by_uid("@friend.user_id")
  	@credits=Credit.find_all_by_friend_id(@friend.id)
	
  	mail(:to => friend.email, :subject => "Borcunu Hatirlatirim" )
  end
end
