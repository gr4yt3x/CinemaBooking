require "test_helper"

class HallsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hall = halls(:one)
  end

  test "should get index" do
    get halls_url, as: :json
    assert_response :success
  end

  test "should create hall" do
    assert_difference("Hall.count") do
      post halls_url, params: { hall: { cinema_id: @hall.cinema_id, name: @hall.name, total_seats: @hall.total_seats } }, as: :json
    end

    assert_response :created
  end

  test "should show hall" do
    get hall_url(@hall), as: :json
    assert_response :success
  end

  test "should update hall" do
    patch hall_url(@hall), params: { hall: { cinema_id: @hall.cinema_id, name: @hall.name, total_seats: @hall.total_seats } }, as: :json
    assert_response :success
  end

  test "should destroy hall" do
    assert_difference("Hall.count", -1) do
      delete hall_url(@hall), as: :json
    end

    assert_response :no_content
  end
end
