require 'test_helper'

class TicketViewerControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get root_path
    assert_response :success
  end
  
  test "should get singleticket when submit form" do
    get singleticket_path(:id =>"1")
    #there should be flash because at the moment there is no ticket
    assert_not flash.empty?
    #there should be flash because at the moment there is no ticket
    assert_equal flash[:notice],'RecordNotFound'
    assert_response :success
  end
  
  test "should get all ticket menu " do
    get alltickets_path
    
    #there should be flash because at the moment there is no ticket
    assert_not flash.empty?
    assert_response :success
  end

end
