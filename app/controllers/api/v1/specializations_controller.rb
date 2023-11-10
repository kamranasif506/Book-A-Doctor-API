class Api::V1::SpecializationsController < ApplicationController
  def index
    @specializations = Specialization.all
    render json: @specializations
  end
  def create
    @specialization = Specialization.new(specialization_params);
    if @specialization.save
      render json: @specialization, status: :created
    else
      render json: @specialization.errors, status: :unprocessable_entity
    end
  end

  private
  def specialization_params
    params.require(:specialization).permit(:name)
  end
end
