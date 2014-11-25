
module Formatter
  class Controller
    attr_reader :methods

    def initialize(methods)
      @methods  = methods.fetch('methods', [])
    end


    def valid_methods
      @valid_methods ||= @methods.map do |key, value|
        key if value
      end.compact
    end

    def has_methods?
      methods.present?
    end

    def all_methods?
      all_methods == valid_methods
    end


    private

    def build_generate_command
      if all_methods?
        "rails g scaffold_controller #{name}"
      else
        "rails g controller #{name} #{valid_methods.join(' ')}"
      end
    end


    def all_methods
      %w|index show new create edit update destroy|
    end


  end
end
