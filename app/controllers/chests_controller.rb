class ChestsController < ApplicationController
  ODDS = 0.08 # 当たり確率（%）

  def index
    redirect_to login_path unless session[:user_id].present?
    @count = params[:count].to_i.clamp(1, 1000) if params[:count]
    @total_count = session[:total_count] || 0
    @total_atari = session[:total_atari] || 0
  end

  def open
    redirect_to login_path unless session[:user_id].present?
  @user = User.find(session[:user_id])
  @count = params[:count].to_i.clamp(1, 1000)
  @results = Array.new(@count) { rand * 100 < ODDS ? "宝玉500個" : "ハズレ" }

  result = @user.result || @user.build_result(total_count: 0, total_atari: 0, rate: 0)
  result.total_count += @count
  result.total_atari += @results.count("宝玉500個")
  result.rate = result.total_count > 0 ? ((result.total_atari.to_f / result.total_count) * 100).round(4) : 0
  result.save

  @total_count = result.total_count
  @total_atari = result.total_atari
  @rate = result.rate

  render :index
  end

  def reset
    redirect_to login_path unless session[:user_id].present?
    @user = User.find(session[:user_id])
  if @user.result
    @user.result.update(total_count: 0, total_atari: 0, rate: 0)
  end
  redirect_to chests_path, notice: "累計をリセットしました。"
end
end