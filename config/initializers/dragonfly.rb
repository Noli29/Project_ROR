require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "416ad9570f66c720f1ff11ed0300b0efd1b94e172dfbcbd7d50b434430435e89"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  else
    datastore :s3,
              bucket_name: 'bodrov_sitepoint',
              access_key_id: Rails.application.secrets.aws_access_key_id,
              secret_access_key: Rails.application.secrets.aws_secret_key,
              url_scheme: 'https'
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
