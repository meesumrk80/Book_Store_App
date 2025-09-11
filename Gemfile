# Gemfile for Book App
# This file specifies all Ruby gems required for your Rails application.

source "https://rubygems.org"

# Core Rails and dependencies
gem "rails", "~> 8.0.2", ">= 8.0.2.1"         # Rails framework
gem "propshaft"
# gem "sprockets-rails"                           # Asset pipeline for Rails 7+
gem "pg", ">= 1.4"                             # PostgreSQL database adapter
gem "puma", ">= 5.0"                           # Web server for development/production

# Frontend and JavaScript
gem "importmap-rails"                          # Use importmap for JS dependencies
gem "turbo-rails"                              # Hotwire Turbo for Rails
gem "stimulus-rails"                           # Hotwire Stimulus for Rails

# API and serialization
gem "jbuilder"                                 # Build JSON APIs

# Authentication and security
gem "bcrypt", "~> 3.1.7"                       # Password hashing for Devise

# Windows-specific gems
gem "tzinfo-data", platforms: %i[ windows jruby ] # Timezone data for Windows/JRuby

# Background jobs and caching
gem "solid_cache"                              # Rails caching
gem "solid_queue"                              # Background job queue
gem "solid_cable"                              # ActionCable for WebSockets

# Performance
gem "bootsnap", require: false                 # Speeds up boot time

# Authentication and authorization
gem "devise"                                   # User authentication
gem "pundit"                                   # Authorization policies

# CSS and frontend styling
# gem "bootstrap", "~> 5.3"                      # Bootstrap CSS framework
# gem "sassc-rails"                              # Sass compiler for Rails

group :development, :test do
  # Debugging and code quality tools
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude" # Debugging
  gem "brakeman", require: false                                      # Security scanner
  gem "rubocop-rails-omakase", require: false                         # Rails style guide
end

group :development do
  # Development-only gems
  gem "web-console"                              # Interactive console in browser
end

group :test do
  # Testing gems
  gem "capybara"                                 # Integration testing
  gem "selenium-webdriver"                       # WebDriver for Capybara
end

# Optional deployment gems
# gem "kamal", require: false                    # Kamal deployment tool
# gem "thruster", require: false                 # Thruster deployment
