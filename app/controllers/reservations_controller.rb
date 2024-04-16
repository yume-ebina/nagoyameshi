class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant

  def index
    @reservations = @restaurant.reservations.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def show
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def new
    @reservation = @restaurant.reservations.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    message = @restaurant.reservations.check_reservation_day(@day.to_date)
    if !!message
      redirect_to @reservation, flash: { alert: message }
    end
  end

  def create
    @reservation = @restaurant.reservations.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save!
      redirect_to restaurant_reservation_path(@restaurant, @reservation)
    else
      render :new
    end
  end

  def destroy
    @reservation = @restaurant.reservations.find(params[:id])
    if @reservation.destroy
      flash[:success] = "予約を削除しました。"
      redirect_to mypage_reserve_users_path
    else
      render :show
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reservation_params
    params.require(:reservation).permit(:day, :time, :start_time)
  end
end
