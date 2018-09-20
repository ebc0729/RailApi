class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
	include ActionController::HttpAuthentication::Basic::ControllerMethods
	http_basic_authenticate_with name: ENV['API_USER'], password: ENV['API_PASS']
end
