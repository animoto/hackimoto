class UsersController < ApplicationController
  def show
    @hackimoto = {}
    @user = User.find(params[:id])
    @user.hacks.each do |hack|
      if @hackimoto[hack.hackimoto]
        @hackimoto[hack.hackimoto].push(hack)
      else
        @hackimoto[hack.hackimoto] = [hack]
      end
    end
  end

  def register_to_hackimoto
    current_user.hack_users.create({ hackimoto_id: params[:hackimoto_id] })
    redirect_to hackimoto_hacks_path(params[:hackimoto_id])
  end

  def register_to_hack
    current_user.hack_users.create({ hackimoto_id: params[:hackimoto_id], hack_id: params[:hack_id] })
    redirect_to hackimoto_hacks_path(params[:hackimoto_id])
  end
end
