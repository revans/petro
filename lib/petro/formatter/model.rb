
module Formatter
  class Model
    def initialize(attributes)
      @attributes = attributes.fetch('attributes', [])
    end

    def attributes
      build_code
    end

    private

    def build_code
      @attributes.map do |att|
        "#{att.first}:#{(att.last || 'string')}"
      end.compact.join(' ')
    end

  end
end
