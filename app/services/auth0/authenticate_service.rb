module Auth0
  class AuthenticateService < Auth0::Auth0Service

    attr_reader :email, :password

    def initialize email, password
      @email = email
      @password = password
    end

    def authenticate
      post_request "#{LOGIN_URL}", post_params
    rescue => err
      msg = "API Authentication: #{err.message}"
      logger.error msg
      logger.debug err.backtrace.join("\n")
      raise Auth0ServiceError, msg
    end

    private

    def post_params
      {
        "client_id":   "#{ENV['AUTH0_CLIENT_ID']}",
        "username":    "#{email}",
        "password":    "#{password}",
        "connection":  "Username-Password-Authentication",
        "grant_type":  "password",
        "scope":       "openid"
      }
    end
  end
end
