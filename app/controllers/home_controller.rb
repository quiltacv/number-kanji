class HomeController < ApplicationController
  
  def index

  end

  def test
    @test = params[:value].to_kansuji
    byebug
  end
end
