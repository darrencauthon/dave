module Dave

  module RequestHandler

    def self.extended handler
      add_handler handler
    end

    def self.handlers
      @handlers ||= []
    end

    def self.add_handler handler
      @handlers ||= []
      @handlers << handler
    end

    def self.handler_for request
      handlers.select { |x| x.can_handle? request }.first
    end

    def self.handle request
      if handler = handler_for(request)
        handler.handle request
      else
        nil
      end
    end

  end

end
