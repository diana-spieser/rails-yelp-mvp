class RestaurantsController < ApplicationController

  # GET /restaurants
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

  if @restaurant.save
    redirect_to @restaurant, notice: "Restaurant was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
 end

 private

 def restaurant_params
  params.require(:restaurant).permit(:name, :address, :category, :phone_number)
end

end