require 'rails_helper'

RSpec.describe Api::V1::TokensController, type: :controller do

  let(:valid_parameters) {
    {email: 'good@test.com', password: 'good'}
  }

  let(:invalid_parameters) {
    {email: 'bad@test.com', password: 'bad'}
  }

  describe "GET #index" do

    context "with a valid token" do
      let(:user){ {id: 1} }
      let(:token){ Knock::AuthToken.new(payload: { sub: user[:id] }).token }

      before() do
        allow(controller).to receive(:authenticate).and_return(token)
      end

      it "returns status ok" do
        get :index
        expect(response.status).to eq 200
      end
    end

    context "with an invalid token" do
      it "returns status unauthorized" do
        get :index
        expect(response.status).to eq 401
      end
    end

  end

  describe "POST #create" do
    let(:fake_authenticate_service) { double(Auth0::AuthenticateService) }

    before(:each) do
      allow(Auth0::AuthenticateService).to receive(:new).and_return(fake_authenticate_service)
      allow(fake_authenticate_service).to receive(:authenticate).and_return(response)
     end

    context "with valid params" do
      let(:response) { OpenStruct.new(body: 'test body', status: 200) }
      
      it "returns a valid token" do
        post :create, params: valid_parameters 
        expect(response.status).to eq 200
      end
    end

    context "with invalid params" do
      let(:response) { OpenStruct.new(body: 'test body', status: 401) }

      it "returns status unauthorized" do
        post :create, params: invalid_parameters 
        expect(response.status).to eq 401
      end
    end
  end
end
