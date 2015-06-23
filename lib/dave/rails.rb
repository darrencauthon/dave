module Dave

  module Rails

    def self.action
      'api#go'
    end

    def self.model_to_string model
      model.to_s.pluralize.underscore
    end

    def self.register the_class, options = {}
      prefix   = options[:prefix] || '/api'
      handlers = options[:handlers] || default_rails_handlers_for(the_class, options)
      Dave.register(the_class, { prefix: prefix, handlers: handlers } )
    end

    def self.default_rails_handlers_for the_class, options
      [Rails::Index, Rails::Detail].map { |x| x.new the_class, options }
    end

    def self.load_api_routes_into routes, options = {}
      Dave.registered_types.keys.each do |the_class|
        Dave.registered_types[the_class][:handlers]
          .select { |x| x.respond_to?(:build_routes) }
          .each   { |h| h.build_routes the_class, routes }
      end
    end

  end

end
