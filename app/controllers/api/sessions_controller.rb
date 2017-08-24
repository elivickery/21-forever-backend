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
      @user = User.find_by(email: params[:email])
      if @user
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

  end
end


