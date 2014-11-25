
class FormatFeature
  attr_reader :features

  def initialize(options)
    @features = build_features(options)
  end




  # What do you want??
  #
  #   * All I care about is the code to generate controllers
  #     and models.
  #
  #   * A feature is both a controller and model, if they both
  #     exist.
  #
  def build_features(options)
    options['features'].map do |f|
      Feature.new(f['name'], f)
    end
  end


  class Feature
    attr_reader :controller, :model, :name
    def initialize(name, options)
      @name       = name
      @controller = ::Formatter::Controller.new(options.fetch('controller', {}))
      @model      = ::Formatter::Model.new(options.fetch('model', {}))
    end


    def has_model?
      @model.attributes.present?
    end

    def has_controller?
      @controller.has_methods?
    end

    def scaffold?
      has_model? && has_controller?
    end

    def code
      return scaffold_code if scaffold?
      [model_code, controller_code].compact.join(' && ')
    end


    def scaffold_code
      "rails g scaffold #{name.pluralize} #{model.attributes}".strip
    end

    def model_code
      "rails g model #{name.singularize} #{model.attributes}".strip
    end


    def controller_code
      if controller.all_methods?
        "rails g scaffold_controller #{name.pluralize}".strip
      elsif controller.has_methods?
        "rails g controller #{name.pluralize} #{controller_methods}".strip
      end
    end


    def controller_methods
      controller.valid_methods.join(' ')
    end

  end
end
