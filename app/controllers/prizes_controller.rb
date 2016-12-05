class PrizesController < ApplicationController
  def index
    @prizes = Prize.where({ category_id: params[:category_id] })
  end

  def show

  end

  def new
    @prize = Prize.new({ category_id: params[:category_id] })
  end

  def create

  end

  def update

  end

  def destroy

  end
end
