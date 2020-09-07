class RepositoriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      @repository = Repository.create!(repositories_params)
      json_response(@repository, :created)
    end

    private

    def repositories_params
      params.permit(:name, :url)
    end

    def json_response(object, status = :ok)
      render json: object, status: status
    end
end
