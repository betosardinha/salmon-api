source "https://rubygems.org"

# Core
gem "rails", "~> 8.1.4", ">= 8.1.4.1"
gem "pg", "~> 1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Cache, jobs and WebSockets
gem "solid_cable", "~> 4.1"
gem "solid_cache", "~> 1.0"
gem "solid_queue", "~> 1.7"

# Authentication
gem "bcrypt", "~> 3.1.22"

# Deployment
gem "kamal", "~> 2.12", require: false

# Server
gem "puma", "~> 8.0"
gem "bootsnap", "~> 1.26", require: false
gem "thruster", "~> 0.1.27", require: false

# Images
gem "image_processing", "~> 1.14"

# CORS
gem "rack-cors", "~> 3.0"

group :development, :test do
  # Debugging
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Security
  gem "bundler-audit", require: false
  gem "brakeman", require: false

  # Linting
  gem "rubocop-rails-omakase", "~> 1.1", require: false
  gem "rubocop-rspec", "~> 3.10", require: false

  # Tests
  gem "rspec-rails", "~> 8.1"
  gem "factory_bot_rails", "~> 6.5"
  gem "faker", "~> 3.8"

  # Env files
  gem "dotenv-rails", "~> 3.2"
end

group :development do
  # Schema annotations
  gem "annotaterb", require: false
end

group :test do
  # One line tests
  gem "shoulda-matchers", "~> 8.0"

  # HTTP stubs
  gem "webmock", "~> 3.34"
end
