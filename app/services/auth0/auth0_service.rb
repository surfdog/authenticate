require 'faraday_middleware'
require 'faraday/conductivity'
require 'net/http'
require 'httpclient'
require 'json'

module Auth0
  class Auth0ServiceError < StandardError; end

  class Auth0Service
    include Logging

    AUTH0_HOST      = ENV['AUTH0_DOMAIN']
    LOGIN_URL       = '/oauth/ro'
  
    attr_reader :parameters

    def initialize parameters
      @parameters = parameters
    end

    protected

    attr_reader :connection, :host_url, :adapter, :api_key

    %w(get post put patch delete).each do |verb|
      define_method("#{verb}_request") do |endpoint, params|
        conn = get_connection
        conn.send(verb, URI.encode(endpoint), params)
      end
    end

    def get_connection
      @connection ||= Faraday.new(url: "https://" + AUTH0_HOST) do |conn|
        conn.request :json
        conn.use :extended_logging, logger: Rails.logger
        conn.response :json, content_type: /\bjson$/
        conn.adapter :httpclient
      end
    end
  end
end