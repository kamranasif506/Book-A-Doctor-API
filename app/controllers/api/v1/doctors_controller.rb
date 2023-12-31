class Api::V1::DoctorsController < ApplicationController
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
    @doctor = Doctor.find(params[:id])
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
    params.require(:doctor).permit(:doctor_name,
                                   :doctorId,
                                   :location, :doctorName,
                                   :specializationId, :profile_picture, :bio,
                                   :profilePicture, :specialization_id,
                                   :time_available_from,
                                   :time_available_to).merge(specialization_id: @specialization.id)
  end
end
