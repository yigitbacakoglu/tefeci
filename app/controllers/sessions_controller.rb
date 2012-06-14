class SessionsController < ApplicationController




  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) 
    if user
    	session[:user_id] = user.id
    	redirect_to root_url
    else
    	token=auth['credentials'].token
    	token_secret=auth['credentials'].secret
    	deneme=User.new(:provider =>auth['provider'],:name =>  auth["info"]["name"] ,:uid => auth['uid'], :token => token, :token_secret => token_secret)
		
		deneme.save
    	session[:user_id] = deneme.id
    	redirect_to root_url
end
  end

  def destroy
  session[:user_id] = nil
  redirect_to root_url
end
end