module Api::V1
    class AuthController < SecureController
        def login
            user = User.find_by(email: params[:email])

            if user && user.authenticate(params[:password])
                render json: { user: user }, status: :ok
            end

            render json: { error: "Invalid email or password" }, status: :unauthorized
        end
    end
end