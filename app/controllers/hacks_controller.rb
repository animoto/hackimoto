class HackimotosController < ApplicationController
  def index

  end

  def show

  end

  def new
    @hack = Hack.new({ hackimoto_id: params[:hackimoto_id] })
  end

  def create

  end

  def update

  end

  def destroy

  end
end
