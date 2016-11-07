require 'rails_helper'

RSpec.describe "Tokens", type: :request do
  describe "GET /tokens" do
  	let(:url){ "http://api.domain.com" }

  	def with_a_valid_token
	    @user = { id: 1 }
	    @token = Knock::AuthToken.new(payload: { sub: @user[:id] }).token
	    @headers = { "Authorization" => "Bearer #{@token}" }
    end

    it "works with a valid token" do
    	with_a_valid_token
      get "#{url}" + v1_tokens_path, headers: @headers
      expect(response).to have_http_status(200)
    end

    it "unauthorized if no token" do
      get "#{url}" + v1_tokens_path
      expect(response).to have_http_status(401)
    end
  end
end

