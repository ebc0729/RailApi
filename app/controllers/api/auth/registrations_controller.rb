module Api
  module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
 
      private
      def sign_up_params
        params.permit(:email, :name, :age, :gender, :favorite_route, :password, :password_confirmation)
      end
 
      def account_update_params
        params.permit(:email, :name, :favorite_route)
      end
 
    end
  end
end
