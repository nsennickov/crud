# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Object.send(:include, FastGettext::Translation)
FastGettext.add_text_domain('app', path: 'locale')
