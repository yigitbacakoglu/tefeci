class OdenmeyenController < ApplicationController   
 
  
  def index  
  	@credits=Credit.find_all_by_durum("not_paid")
                                                            
  end                                                              
 
        
  
end        