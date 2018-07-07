require 'test_helper'

class GardesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gardes_index_url
    assert_response :success
  end

end
