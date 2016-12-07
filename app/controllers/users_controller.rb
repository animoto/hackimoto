class UsersController < ApplicationController
  before_filter :define_hackimoto

  def register_to_hackimoto
    current_user.hack_users.create({ hackimoto_id: @hackimoto.id })
    redirect_to hackimoto_hacks_path(@hackimoto)
  end

  private

  def define_hackimoto
    @hackimoto = Hackimoto.find(params[:hackimoto_id])
  end
end
