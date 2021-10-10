# frozen_string_literal: true

require "bundler/setup"
require "ctci"
require "simplecov"

SimpleCov.start do
  enable_coverage :branch
  add_filter "/spec/"
  track_files "{lib}/**/*.rb"
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.expose_dsl_globally = true

  config.warnings = true

  # Enable random ordering when running the tests
  config.order = :random

  # Enable profiling
  config.profile_examples = 5
end
