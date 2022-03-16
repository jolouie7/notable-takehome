class AppointmentsController < ApplicationController
  ###
  #
  # /appointments/:id
  #
  ###
  def show
    # Get a list of all appointments for a particular doctor and particular day
    # appointments of this doctor
    @appointment_ids = Appointment.all(:join => :doctors, :conditions => ["doctors.id = ?", params:id]).map(&:id)
    @appointments = Appointment.all(:include => :doctors, :conditions => ["appointments.id IN (?)", @appointment_ids])
    # appointments on a certain day
  end

  ###
  #
  # /appointments
  #
  ###
  def create
    # Validate that the time is either :00, :15, :30, :45
    valid_times = [":00", ":15", ":30", ":45"]
    # Check the doctor has less then 3 appointments at that time
    @appointment = Appointment.new(appointment_params)
    if @appointment
      if !@appointment.time.last(3).in?(valid_times)
        render json: { error: "Unable to create appointment due to invalid time!"}
      end

      # Get all of doctors appointments where time is @appointment.time
      # if returned appointment times >= 3 return error
      @doctor_appointments = Doctor.appointment.where(@appointment.time)
      p "doctor_appointments:", Doctor.appointment
      if @doctor_appointments.length >= 3
        render json: { error: `Unable to create appointment due to having more then 3 appointments at #{@appointment.time}`}
      end
    end
  end

  ###
  #
  # /appointments/:id
  #
  ###
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    render json: { message: "Successfully Deleted Todo!"}
  end

  private
  # only allow a list of trusted parameters through
  def appointment_params
    params.require(:appointment).permit(:patient_first_name, :patient_last_name, :date, :time, :doctor_id)
  end
end
