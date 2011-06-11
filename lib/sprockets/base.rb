require 'sprockets/asset_attributes'
require 'sprockets/digest'
require 'sprockets/processing'
require 'sprockets/server'
require 'sprockets/static_compilation'
require 'sprockets/trail'

module Sprockets
  class Base
    include Digest, Processing, Server, StaticCompilation, Trail

    attr_reader :logger

    attr_reader :context_class

    def index
      raise NotImplementedError
    end

    def attributes_for(path)
      AssetAttributes.new(self, path)
    end

    def content_type_of(path)
      attributes_for(path).content_type
    end

    protected
      def expire_index!
        raise NotImplementedError
      end
  end
end