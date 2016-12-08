class PrizesController < ApplicationController
  before_filter :define_category, :define_hackimoto

  def new
    @prize = Prize.new({ category: @category })
  end

  def edit
    @prize = Prize.find(params[:id])
    render :new
  end

  def create
    @prize = @category.prizes.new(prize_params)

    if @prize.save
      if !params[:prize][:winner].blank?
        Winner.create({ hack_id: params[:prize][:winner], prize_id: @prize.id })
      end
      redirect_to hackimoto_path(@hackimoto)
    else
      redirect_to hackimoto_path(@hackimoto)
    end
  end

  def update
    @prize = Prize.find(params[:id])
    @prize.update(prize_params)
    if params[:prize][:winner].blank?
      if @prize.winner
        @prize.winner.delete
      end
    else
      if @prize.winner
        @prize.winner.update({ hack_id: params[:prize][:winner] })
      else
        Winner.create({ hack_id: params[:prize][:winner], prize_id: @prize.id })
      end
    end
    redirect_to hackimoto_path(id: @hackimoto.id)
  end

  def destroy
    @prize = Prize.find(params[:id])
    @prize.destroy

    redirect_to hackimoto_path({ id: @hackimoto })
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
