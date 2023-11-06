class Api::V1::AppointmentsController < ApplicationController
  # before_action :authenticate_user!

  before_action :set_appointment, except: %i[index new create]
  def index
    @appointments = current_user.appointments
    render json: @appointments
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
    p("thsi is params#{@appointment}")
    @appointment.user = current_user
    @doctor = Doctor.find(params[:doctor_id])
    @appointment.doctor = @doctor

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
    p("thsi is params#{params}")
    params.require(:appointment).permit(:location, :date, :time, :duration, :doctor_id)
  end
end
