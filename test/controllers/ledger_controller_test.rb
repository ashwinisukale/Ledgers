require 'test_helper'

class LedgerControllerTest < ActionDispatch::IntegrationTest
  test "should get display" do
    get ledger_display_url
    assert_response :success
  end

end
