class HackimotosController < ApplicationController
  before_filter :login_required, :super_admin_required, only: [:new, :create, :update, :destroy]

  def index
    @hackimotos = Hackimoto.all.order(start_date: :desc)
    @hackimoto_by_year = {}
    @hackimotos.each do |hackimoto|
      if @hackimoto_by_year[hackimoto.start_date.year]
        @hackimoto_by_year[hackimoto.start_date.year].push(hackimoto)
      else
        @hackimoto_by_year[hackimoto.start_date.year] = [hackimoto]
      end
    end
  end

  def show
    @hackimoto = Hackimoto.find(params[:id])
  end

  def new
    @hackimoto = Hackimoto.new
  end

  def edit
    @hackimoto = Hackimoto.find(params[:id])
    render :new
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
    @hackimoto = Hackimoto.find(params[:id])
    @hackimoto.update(hackimoto_params)
    redirect_to hackimoto_path(id: @hackimoto.id)
  end

  def destroy
    @hackimoto = Hackimoto.find(params[:id])
    @hackimoto.destroy

    redirect_to hackimotos_path
  end

  private

  def hackimoto_params
    allowed_params = params.require(:hackimoto).permit(:name, :description, :start_date)
    allowed_params.merge({ is_myagi: params[:hackimoto][:is_myagi] == "MYAGI" ? true : false })
  end
end
