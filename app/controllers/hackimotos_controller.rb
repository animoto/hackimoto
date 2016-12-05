class HackimotosController < ApplicationController
  def index
    @hackimotos = Hackimoto.all
  end

  def show

  end

  def new
    @hackimoto = Hackimoto.new
  end

  def create

  end

  def update

  end

  def destroy

  end
end
