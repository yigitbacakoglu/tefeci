class TweetsController < ApplicationController       
  
  def create  

    #twitter üzerinde borçlu olanı ifşa ediyoruz ... 
      twitter = User.find_by_uid(current_user.uid.to_s)
    if twitter.present?
      Twitter.configure do |config|
 		  config.consumer_key = "EuUWGIGOUNS47bjml9Q"
  		config.consumer_secret = "a0QAIEVcOKGsj4gKlal9YmA5pwMlRsGtQtdzBBRVO00"
  		config.oauth_token = twitter.token
  		config.oauth_token_secret = twitter.token_secret
		end
      Twitter.update(params[:tweet])
      redirect_to friends_path
      
  end 
      
end
end


