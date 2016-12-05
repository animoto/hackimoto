class PrizesController < ApplicationController
  before_filter :define_category, :define_hackimoto

  def new
    @prize = Prize.new({ category: @category })
  end

  def create
    @prize = @category.prizes.new(prize_params)

    if @prize.save
      redirect_to hackimoto_path(@hackimoto)
    else
      redirect_to hackimoto_path(@hackimoto)
    end
  end

  def update

  end

  def destroy

  end

  private

  def define_hackimoto
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
  end

  def define_category
    @category = Category.find(params[:category_id])
  end

  def prize_params
    params.require(:prize).permit(:rank, :amount)
  end

end
