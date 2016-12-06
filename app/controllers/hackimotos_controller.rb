class HackimotosController < ApplicationController
  before_filter :super_admin_required, only: [:new, :create, :update, :destroy]

  def index
    @hackimotos = Hackimoto.all
  end

  def show
    @hackimoto = Hackimoto.find(params[:id])
  end

  def new
    @hackimoto = Hackimoto.new
  end

  def create
    @hackimoto = Hackimoto.new(hackimoto_params)

    if @hackimoto.save
      redirect_to @hackimoto
    else
      redirect_to hackimoto_path
    end
  end

  def update

  end

  def destroy

  end

  private

  def hackimoto_params
    params.require(:hackimoto).permit(:name, :description, :start_date)
  end
end
