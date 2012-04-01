class OdenenController < ApplicationController   
 
  before_filter :login_required
  def index  

    @credits=Credit.find_all_by_durum("paid")

  end                                                              
 
        
  
end        