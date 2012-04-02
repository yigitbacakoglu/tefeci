class OdenenController < ApplicationController   
 
  before_filter :login_required
  def index  
	@friend=Friend.find_by_user_id(@current_user.uid)
    @credits=Credit.find_all_by_durum_and_friend_id("paid",@friend.id)

  end                                                              
 
        
  
end        