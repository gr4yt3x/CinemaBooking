require "test_helper"

class MovieSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_session = movie_sessions(:one)
  end

  test "should get index" do
    get movie_sessions_url, as: :json
    assert_response :success
  end

  test "should create movie_session" do
    assert_difference("MovieSession.count") do
      post movie_sessions_url, params: { movie_session: { end_time: @movie_session.end_time, hall_id: @movie_session.hall_id, is_active: @movie_session.is_active, language: @movie_session.language, movie_id: @movie_session.movie_id, price_full: @movie_session.price_full, price_half: @movie_session.price_half, start_time: @movie_session.start_time, subtitles: @movie_session.subtitles } }, as: :json
    end

    assert_response :created
  end

  test "should show movie_session" do
    get movie_session_url(@movie_session), as: :json
    assert_response :success
  end

  test "should update movie_session" do
    patch movie_session_url(@movie_session), params: { movie_session: { end_time: @movie_session.end_time, hall_id: @movie_session.hall_id, is_active: @movie_session.is_active, language: @movie_session.language, movie_id: @movie_session.movie_id, price_full: @movie_session.price_full, price_half: @movie_session.price_half, start_time: @movie_session.start_time, subtitles: @movie_session.subtitles } }, as: :json
    assert_response :success
  end

  test "should destroy movie_session" do
    assert_difference("MovieSession.count", -1) do
      delete movie_session_url(@movie_session), as: :json
    end

    assert_response :no_content
  end
end
