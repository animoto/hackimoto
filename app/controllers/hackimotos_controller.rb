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

  def add_judge_form
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
    render :add_judge
  end

  def add_judge
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
    @hackimoto.judges.create({ user_id: params[:hackimoto][:judges] })
    redirect_to hackimoto_path(@hackimoto)
  end

  def remove_judge
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
    @hackimoto.judges.find_by(user_id: params[:user_id]).delete
    redirect_to hackimoto_path(@hackimoto)
  end

  def add_admin_form
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
    render :add_admin
  end

  def add_admin
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
    @hackimoto.hackimoto_admin_users.create({ user_id: params[:hackimoto][:hackimoto_admin_users] })
    redirect_to hackimoto_path(@hackimoto)
  end

  def remove_admin
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
    @hackimoto.hackimoto_admin_users.find_by(user_id: params[:user_id]).delete
    redirect_to hackimoto_path(@hackimoto)
  end

  private

  def hackimoto_params
    allowed_params = params.require(:hackimoto).permit(:name, :description, :start_date)
    allowed_params.merge({ is_myagi: params[:hackimoto][:is_myagi] == "MYAGI" ? true : false })
  end
end
