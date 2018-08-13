module Api
  module Auth
    class EditController < DeviseTokenAuth::ApplicationController
      private
      def edit_params
        params.permit(:email, :password)
        User.find(params[:email]).destroy
      end
    end
  end
end
