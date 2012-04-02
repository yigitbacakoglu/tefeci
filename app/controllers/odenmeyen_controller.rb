class OdenmeyenController < ApplicationController   
 before_filter :login_required
  
  def index  

  	# find by durum ve friend id olacak. friend idsini current user uid den alicak. 
  	@friend=Friend.find_by_user_id(@current_user.uid)
  	@credits=Credit.find_all_by_durum_and_friend_id("not_paid",@friend.id)
                                                            
  end                                                              
 
        
  
end        