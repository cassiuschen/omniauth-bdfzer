require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bdfzer < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, :bdfzer

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site =>  "http://auth.bdfzer.com",
        :authorize_url => "/oauth/authorize"
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['uid'] }

      info do
        {
          :email => raw_info['email'],
          :name => raw_info['info']['name'],
          :phone => raw_info['info']['phone']
        }
      end

      extra do
        {
          :raw_info => raw_info,
          :grade => raw_info['extra']['grade'],
          :unit => raw_info['extra']['unit'],
          :sex => raw_info['extra']['sex'],
          :contact => raw_info['extra']['contact']
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/omniauth.json").parsed
      end
    end
  end
end

