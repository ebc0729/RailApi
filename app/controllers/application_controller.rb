class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  config.time_zone = 'Tokyo'
  config.active_record.default_timezone = :local
end
