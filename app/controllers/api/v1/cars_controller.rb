class Api::V1::CarsController < ApplicationController
 

  def index
    @cars = Car.all
    render json: @cars
  end


  def create 
    @car = Car.new(car_params)
    if @car.save
      render json: @car, status: :created
    else
      render json: { error: 'Unable to create car.' }, status: 400
    end
  end
  




 private

 def car_params
  params.require(:car).permit(:make, :model, :year, :color, :body_type, :engine_capacity, :engine_cylinders, :turbo, :horsepower, :torque, :weight, :drivetrain, :transmission, :fuel_type, :doors, :seats, :mileage, :price, :description, :image)
 end

end
