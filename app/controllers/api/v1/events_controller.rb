class API::V1::EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def create
    event = Event.new(allowed_params)

    if event.save
      render json: event, status: :created
    else
      render json: {
        message: 'Validation Failed',
        errors: event.errors.full_messages,
      }, status: :unprocessable_entity
    end
  end

  private

  def allowed_params
    params.require(:event).permit(:start_at, :title, :description)
  end
end
