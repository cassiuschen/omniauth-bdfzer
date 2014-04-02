require 'omniauth/strategies/oauth2'
require 'base64'
require 'openssl'
require 'rack/utils'
require 'uri'


require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bdfzer < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, :bdfzer

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site =>  "http://saas.bdfzer.com:4567",
        :authorize_url => "/oauth/authorize"
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :email => raw_info['email']
        }
      end

      extra do
        {
          :name => raw_info['extra']['name'],
          :pku_id => raw_info['extra']['pku_id']
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/omniauth.json").parsed
      end
    end
  end
end

