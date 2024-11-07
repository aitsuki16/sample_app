class ApplicationController < ActionController::Base
    include SessionsHelper

    def hello
        render html: "hello, world!"
    end

    private

    # Stores the URL trying to be accessed for friendly forwarding
    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end
end
