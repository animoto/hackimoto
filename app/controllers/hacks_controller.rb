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

  def edit
    @hack = Hack.find(params[:id])
    render :new
  end

  def create
    @hack = @hackimoto.hacks.new(hacks_params.merge({ proposed_user_id: current_user.id }))

    if @hack.save
      @hack.hack_users.create({ user_id: current_user.id, hackimoto_id: @hackimoto.id })
      redirect_to hackimoto_hacks_path({ id: @hackimoto })
    else
      redirect_to hackimoto_hacks_path({ id: @hackimoto })
    end
  end

  def update
    @hack = Hack.find(params[:id])
    @hack.update(hacks_params)
    redirect_to hackimoto_path(id: @hackimoto.id)
  end

  def destroy
    @hack = Hack.find(params[:id])
    @hack.destroy

    redirect_to hackimoto_path({ id: @hackimoto })
  end

  private

  def define_hackimoto
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
  end

  def hacks_params
    params.require(:hack).permit(:name, :description)
  end
end
