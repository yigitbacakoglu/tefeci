class UserMailer < ActionMailer::Base
  default :from => "tefecidefteri@gmail.com"
  def credit_confirmation(friend,user)
  	@friend=friend
  	@user=user
  	@credits=Credit.find_all_by_friend_id(@friend.id)

  	mail(:to => friend.email, :subject => "Borcunu Hatirlatirim" )
  end
end
