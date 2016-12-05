class HacksController < ApplicationController
  before_filter :define_hackimoto

  def index
    @hacks = Hack.where({ hackimoto: @hackimoto })
  end

  def show

  end

  def new
    @hack = Hack.new({ hackimoto: @hackimoto })
  end

  def create
    @hack = @hackimoto.hacks.new(hacks_params)

    if @hack.save
      redirect_to hackimoto_path({ id: @hackimoto })
    else
      redirect_to hackimoto_path({ id: @hackimoto })
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

  def hacks_params
    params.require(:hack).permit(:name, :description)
  end
end
