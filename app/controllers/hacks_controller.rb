class HackimotosController < ApplicationController
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

  end

  def update

  end

  def destroy

  end

  private

  def define_hackimoto
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
  end
end
