OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],
  scope: 'public_profile', info_fields: 'id, name, link',
  client_options: {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}
end
