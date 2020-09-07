class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @events = Event.all
    json_response(@events)
  end

  def create
    @event = Event.find_by(id: params[:id])
    if (@event != nil)
        return json_response("",404)
    end
    @event = Event.create!(event_params)
    json_response(@event, :created)
  end

  def show
    @event = Event.find_by(id: params[:id])
    if (@event == nil)
        return json_response(@event,404)
    end
    json_response(@event)
  end

  def show_by_actor
    @actor = Actor.find_by(id: params[:actor_id])
    if (@actor == nil)
        return json_response(@actor,404)
    end
    @event = Event.find_by(actor: params[:actor_id])
    json_response(@event)
  end

  def erase
      Event.delete_all
      Actor.delete_all
      Repository.delete_all
      json_response(nil,200)
  end

  private

  def event_params
    params.permit(:type, :actor, :repo)
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
