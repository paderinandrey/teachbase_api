module ClientHelper
  Request = Struct.new 'Request', :verb, :uri, :headers, :body
  Response = Struct.new 'Response', :code, :headers, :body

  API_VERSION = 'v1'.freeze
  TARGET_HOST = 'http://s1.teachbase.ru'.freeze

  class OAuth2
    class << self
      attr_accessor :token

      def authorize(request)
        new.authorize(request)
      end
    end

    attr_accessor :token

    def initialize(attr = {})
      @consumer_key    = attr[:consumer_key] || Rails.application.secrets.client_key
      @consumer_secret = attr[:consumer_secret] || Rails.application.secrets.secret_key
    end

    def authorize(request)
      request.headers = { 'Authorization' => "Bearer #{token}" } if token
      request
    end

    def token
      @token ||= take_token
    end

    private

    def take_token

      response = RestClient.post "#{TARGET_HOST}/oauth/token", {
        grant_type: 'client_credentials',
        client_id: @consumer_key,
        client_secret: @consumer_secret
      }
      JSON.parse(response)['access_token']
    rescue RestClient::Exception => e
      Response.new(e.http_code, {}, e.http_body)

    end
  end

  class Connect
    class << self

      def execute(request)

        if request
          result = execute_core request
          Response.new(200, {}, result)
        end
      rescue RestClient::Exception => e
        Response.new(e.http_code, {}, e.http_body)

      end

      private

      def execute_core(request)
        RestClient::Request.execute(
          method: request.verb,
          url: request.uri.to_s,
          headers: request.headers,
          payload: request.body,
          timeout: 10
        )
      end
    end
  end
end
