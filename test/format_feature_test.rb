require 'test_helper'
require 'yaml'

class FormatFeatureTest < Minitest::Test

  def data(name)
    ::Pathname.new(__dir__).join("assets/#{name}")
  end

  def setup
    @feature_data = YAML.load( data('feature.yml').read )
  end


  def test_features
    formatter = FormatFeature.new(@feature_data)
    features  = formatter.features

    code  = "rails g scaffold projects name:string user_id:integer description:text"
    code2 = "rails g scaffold tasks name:string project_id:integer description:text priority:integer"
    code3 = "rails g model item && rails g controller items index"
    code4 = "rails g model user email:string password_digest:string"
    code5 = "rails g model setting name:string user:references"

    assert_equal code,    features[0].code
    assert_equal code2,   features[1].code
    assert_equal code3,   features[2].code
    assert_equal code4,   features[3].code
    assert_equal code5,   features[4].code
  end

end
