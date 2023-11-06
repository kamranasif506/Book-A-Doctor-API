class Api::V1::DoctorsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    @doctors = Doctor.all
    @doctor = @doctors.find(params[:id])
    render json: @doctor
  end

  def create
    @specialization = Specialization.find(params[:specialization_id])
    @doctor = @specialization.doctors.new(doctor_params)

    if @doctor.save
      render json: @doctor, status: :created
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def update
    if @doctor.update(doctor_params)
      render json: @doctor, status: :success
    else
      render json: @doctor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @doctor.destroy
      render json: { message: 'Doctor was successfully destroyed' }, status: :ok
    else
      render json: { errors: @doctor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:doc_name, :profile_picture, :bio, :time_available_from,
                                   :time_available_to).merge(specialization_id: @specialization.id)
  end
end
