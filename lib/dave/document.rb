module Dave

  class Document

    attr_accessor :resource, :embedded, :links

    def initialize
      @resource, @embedded, @links = {}, {}, {}
    end

    def to_hash
      {}.tap { |x| x.merge!(_links: links) if links.present? }
        .tap { |x| x.merge!(resource) if resource.present? }
        .tap { |x| x.merge!(_embedded: embedded) if embedded.present? }
    end

    def to_json
      to_hash.to_json
    end

  end

end
