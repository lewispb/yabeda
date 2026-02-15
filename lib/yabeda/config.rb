# frozen_string_literal: true

require "anyway"

module Yabeda
  # Runtime configuration for the main yabeda gem
  class Config < ::Anyway::Config
    config_name :yabeda

    # Declare and collect metrics about Yabeda performance
    attr_config debug: false

    # Callable that returns a process identifier for per-process metrics tagging.
    # Defaults to Process.pid but can be overridden with stable identifiers (e.g. Puma worker index).
    attr_config pid_provider: -> { Process.pid }

    # Implement predicate method from AnywayConfig 2.x to support AnywayConfig 1.x users
    alias debug? debug unless instance_methods.include?(:debug?)
  end
end
