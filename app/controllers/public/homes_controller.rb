class Public::HomesController < ApplicationController
  def top
    @list= List.new
    @lists = List.order(created_at: :desc).limit(3)
  end

  def about
  end
end
