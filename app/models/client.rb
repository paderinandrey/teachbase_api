class Client
  include ClientHelper

  class << self
    def get(path, params = {})
      new.get(path, params)
    end
  end

  def get(path, params = {})
    uri = Addressable::URI.parse("#{TARGET_HOST}/endpoint/#{API_VERSION}#{path}")
    uri.query_values = params unless params.empty?
    invoke_verb(:get, uri)
  end

  private

  def invoke_verb(name, uri, body = nil)
    request = Request.new name, uri, {}, body
    response = Connect.execute OAuth2.authorize(request)
    return '' unless response
    response
  end
end
