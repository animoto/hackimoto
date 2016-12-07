class CategoriesController < ApplicationController
  before_filter :define_hackimoto

  def new
    @category = Category.new({ hackimoto: @hackimoto })
  end

  def edit
    @category = Category.find(params[:id])
    render :new
  end

  def create
    @category = @hackimoto.categories.new(categories_params)

    if @category.save
      redirect_to hackimoto_path({ id: @hackimoto })
    else
      redirect_to hackimoto_path({ id: @hackimoto })
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update(categories_params)
    redirect_to hackimoto_path(id: @hackimoto.id)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to hackimoto_path({ id: @hackimoto })
  end

  private

  def define_hackimoto
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
  end

  def categories_params
    params.require(:category).permit(:name, :description)
  end

end
