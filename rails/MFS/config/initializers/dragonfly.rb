require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  protect_from_dos_attacks true
  secret "4v4diduz2nkadggtvrfxa"

  url_format "/media/:job/:name"

  datastore :s3,
            bucket_name: 'campaignermain',
            access_key_id: 'AKIAIPGI4RPY2P3BSCNQ',
            secret_access_key: '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'

  #datastore :file,
  #  root_path: Rails.root.join('public/system/dragonfly', Rails.env),
  #  server_root: Rails.root.join('public')
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
