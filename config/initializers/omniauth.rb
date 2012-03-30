#Twitter.configure do |config|
 # config.consumer_key = "Miv1CyMKXNEVeM9PYc76jg"
  #config.consumer_secret = "sEy1X6DGHPet82YiTki17s93Eqjm6QZR26xApxRuYs"
  #config.oauth_token = "67595179-fxOXxfnq5DWPe3fHYqBTOki0s86LFlsswh38ihbOM"
  #config.oauth_token_secret = "PcYs4sy7hGpn9NpJ1mpanijqGBwCxWVFCEMLaDqxA"
#end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'EuUWGIGOUNS47bjml9Q', 'a0QAIEVcOKGsj4gKlal9YmA5pwMlRsGtQtdzBBRVO00'
end
