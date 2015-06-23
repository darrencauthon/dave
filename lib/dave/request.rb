module Dave

  class Request

    attr_reader :args
    attr_reader :method
    attr_reader :path
    attr_reader :requestor

    def initialize method, args, path, requestor = nil
      @args, @method, @path, @requestor = args, method, path, requestor
    end

    def self.from_request request
      self.new request.method.downcase, request.params.dup, request.path
    end

    def get_response
      RequestHandler.handle self
    end

  end

end
