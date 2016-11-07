module Api::V1
  class TokensController < ApplicationController
    before_action :authenticate, only: [:index]

    # GET /tokens
    def index
      render json: current_user, status: 200
    end

    # POST /tokens
    def create
      begin
        response = ::Auth0::AuthenticateService.new(token_params[:email], token_params[:password]).authenticate
        render json: response.body, status: response.status
      rescue ::Auth0::Auth0ServiceError => err 
        render err.message, status: 401
      end
    end

    private
      # Only allow a trusted parameter "white list" through.
      def token_params
        params.permit(:email, :password)
      end
  end
end
