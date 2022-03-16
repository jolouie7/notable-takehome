class DoctorsController < ApplicationController
  def index
    @doctor = Doctor.all
    render json: @doctor
  end
end
