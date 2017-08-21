module Api
  class SessionsController < ApplicationController

    def create
      user = User.find_by(email: params[:email].downcase)
        if user && user.authenticate(params[:password])
          render json: {
            found: true,
            accessToken: user.access_token
          }.to_json
        else
          render json: {
            found: false,
            errors: ['Incorrect e-mail or password']
          }.to_json
        end
    end

    def verify_access_token
      @user = User.find_by(access_token: params[:access_token])
      if @user
        render text: "verified", status: 200
      else
        render text: "Token failed verification", status: 422
      end
    end

  end
end


