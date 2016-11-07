require "rails_helper"

RSpec.describe Api::V1::TokensController, type: :routing do
  describe "routing" do

    let(:url){ "http://api.domain.com/v1" }

    it "routes to #index" do
      expect(:get => "#{url}/tokens").to route_to("api/v1/tokens#index", subdomain: 'api')
    end

    it "routes to #show" do
      expect(:get => "#{url}/tokens/1").to route_to("api/v1/tokens#show", :id => "1", subdomain: 'api')
    end

    it "routes to #create" do
      expect(:post => "#{url}/tokens").to route_to("api/v1/tokens#create", subdomain: 'api')
    end

    it "routes to #update via PUT" do
      expect(:put => "#{url}/tokens/1").to route_to("api/v1/tokens#update", :id => "1", subdomain: 'api')
    end

    it "routes to #update via PATCH" do
      expect(:patch => "#{url}/tokens/1").to route_to("api/v1/tokens#update", :id => "1", subdomain: 'api')
    end

    it "routes to #destroy" do
      expect(:delete => "#{url}/tokens/1").to route_to("api/v1/tokens#destroy", :id => "1", subdomain: 'api')
    end
  end
end
