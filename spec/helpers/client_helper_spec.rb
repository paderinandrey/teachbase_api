require 'rails_helper'

RSpec.describe ClientHelper, type: :helper do
  describe 'OAuth2' do
    describe '#authorize' do
      it 'adds an authorization header' do
        uri = Addressable::URI.parse('https://abc/')

        helper do
          request = Request.new :get, uri
          authorized_request = OAuth2.authorize request

          expect(authorized_request.headers.keys).to include 'Authorization'
        end
      end
    end
  end

  describe 'Connect' do
    let(:oauth2) { ClientHelper::OAuth2.new }

    describe '.execute' do
      describe 'handles authorization' do
        let(:fake_ok_response) do
          double 'A fake OK response',
             code: 200,
             body: 'A fake response body'
        end

        before do
          allow(ClientHelper::Connect).to receive(:execute).and_return fake_ok_response

          allow(ClientHelper::OAuth2).to receive(:new).and_return(oauth2)

          allow(oauth2).to receive(:authorize) {|request| request }
        end

        it 'authorizes before it queries the internet' do
          expect(oauth2).to receive(:authorize).once.ordered
          expect(ClientHelper::Connect).to receive(:execute).once.ordered

          Client.get '/abc'
        end

        it 'queries the internet with expanded earl and query parameters' do
          expected_uri = Addressable::URI.parse('https://www.test.com/1/xxx?a=1&b=2')
          helper do
            expected_request = Request.new :get, expected_uri, {}
            expect(ClientHelper::Connect).to receive(:execute).once.with expected_request

            Client.get '/abc', a: '1', b: '2'
          end
        end
      end
    end
  end
end
