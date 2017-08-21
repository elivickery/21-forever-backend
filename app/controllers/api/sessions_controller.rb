module Api
  class SessionsController < ApplicationController

    def new
    end
    #If user login data  valid is it will return the access_token.
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
    #Verifies the access_token.
    def verify_access_token
      user = User.find_by(access_token: params[:access_token])
        if user
          render text: "verified", status: 200
        else
          render text: "Token failed verification", status: 422
        end
    end


    #the _url is needed if redirecting for root. - convention/ rails docs say so
    # root is set in the routes. right now there are no routes set.
     def destroy
        log_out if logged_in?
        redirect_to root_url
      end
  end
end


