require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get games_start_url
    assert_response :success
  end

  test "should get question" do
    get games_question_url
    assert_response :success
  end

  test "should get answer" do
    get games_answer_url
    assert_response :success
  end

  test "should get result" do
    get games_result_url
    assert_response :success
  end
end
