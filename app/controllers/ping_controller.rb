class PingController < ApplicationController
  def index
    db_status = "unknown"
    db_error  = nil

    begin
      value = ActiveRecord::Base.connection.select_value("SELECT 1")
      db_status = (value.to_i == 1) ? "up" : "down"
    rescue => e
      db_status = "down"
      db_error  = e.class.name
    end

    render json: {
      status: "OK",
      db: db_status,
      error: db_error,
      time: Time.current.iso8601
    }
  end
end
