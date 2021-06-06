
    class RegistrationsController < Devise::RegistrationsController
     

      def create
        binding.pry
          user = User.new(sign_up_params)
     
          if user.save
            token = user.generate_jwt
            render json: token.to_json
            binding.pry
          else
            render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
          end
        end

        private
        def sign_up_params
          params.require(:user).permit(:email, :password, :password_confirmation)
      end
  
      def account_update_params
          params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
      end
   
end