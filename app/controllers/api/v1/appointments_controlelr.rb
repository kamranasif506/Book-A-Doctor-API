class Api::V1::AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, except: %i[index new create]
  def index
    @appointment = current_user.appointments
    render json: @appointment
  end

  def new
    @appointment = Appointment.new
    render json: @appointment
  end

  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @doctor = Doctor.find(params[:doctor_id])
    @appointment.doctor = @doctor
    puts "IDG: #{@group.id}"

    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end


  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :duration).merge(user_id: current_user.id,
                                                                       doctor_id: @doctor.id)
  end
end