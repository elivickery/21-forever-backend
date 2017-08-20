module Api
  class SessionsController < ApplicationController

    def new
    end
    #If user login data  valid is it will return the access_token.
    def create
      user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          render :text => user.access_token, status: 200
        else
          render text: "Email and password combination are invalid", status: 422
        end
    end
    #Verifies the access_token.
    def verify_access_token
      user = User.find_by(access_token: params[:session][:access_token])
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


