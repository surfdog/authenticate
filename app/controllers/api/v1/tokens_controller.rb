module Api::V1
  class TokensController < ApplicationController
    before_action :authenticate, only: [:index]

    # GET /tokens
    def index
      render status: 200
    end

    # POST /tokens
    def create
      #call Auth0 service
      
      # @token = Token.new(token_params)

      # if @token.save
      #   render json: @token, status: 200
      # else
      #   render json: @token.errors, status: 401
      # end
      render status: 200
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_token
        @token = Token.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def token_params
        params.fetch(:token, {})
      end
  end
end
