class ActorsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
      @actors = Actor.all
      @actors.each do |actor|
          events = Event.find_by(actor: actor.id)
          actor.number_events = events.length()
          actor.latest_event = events.last.created_at
      end
      @actors.sort_by { |actor| [actor.number_events, actor.latest_event, actor.login] }
      json_response(@actors,200)
    end

    def create
      @actor = Actor.create!(actor_params)
      json_response(@actor, :created)
    end

    def update
        @actor = Actor.find_by(id: params[:id])
        if (@actor == nil || params[:login])
            return json_response(@actor, 404)
        end
        @actor.avatar_url = params[:avatar_url]
        @actor.save
        json_response(@actor, 200)
    end

    private

    def actor_params
      params.permit(:login, :avatar_url)
    end

    def json_response(object, status = :ok)
      render json: object, status: status
    end
end
