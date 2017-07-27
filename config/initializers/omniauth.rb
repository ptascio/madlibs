OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id,
  Rails.application.secrets.facebook_app_secret, scope:
  'public_profile', info_fields: 'id, name, link',
  client_options: {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}
end
