class HomeController < ApplicationController
  def index
    render json: { message: "home json" }
  end
end
