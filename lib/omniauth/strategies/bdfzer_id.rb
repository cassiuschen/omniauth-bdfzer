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
      option :name, "bdfzer"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      CUSTOM_PROVIDER_URL = 'http://localhost:8080'
      option :client_options, {
        :site =>  CUSTOM_PROVIDER_URL,
        :authorize_url => "#{CUSTOM_PROVIDER_URL}/auth/bdfzer_id/authorize",
        :access_token_url => "#{CUSTOM_PROVIDER_URL}/auth/bdfzer_id/access_token"
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
        @raw_info ||= access_token.get("/auth/bdfzer_id/user.json?oauth_token=#{access_token.token}").parsed
      end
    end
  end
end

