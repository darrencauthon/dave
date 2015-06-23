if defined?(ApplicationController)

  class ApiController < ApplicationController

    def go
      the_request  = Dave::Request.from_request request
      the_response = the_request.get_response
      render json: the_response.to_hash
    end

  end


elsif defined?(ActionController::Base)

  class ApiController < ActionController::Base

    def go
      the_request  = Dave::Request.from_request request
      the_response = the_request.get_response
      render json: the_response.to_hash
    end

  end

end
