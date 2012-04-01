class OdenenController < ApplicationController   
 
  
  def index  

    @credits=Credit.find_all_by_durum("paid")

  end                                                              
 
        
  
end        