# frozen_string_literal: true

require "fiber"

module ActiveSupport
  module IsolatedExecutionState # :nodoc:
    @isolation_level = :thread

    Thread.attr_accessor :active_support_execution_state
    Fiber.attr_accessor :active_support_execution_state

    class << self
      attr_reader :isolation_level

      def isolation_level=(level)
        unless %i(thread fiber).include?(level)
          raise ArgumentError, "isolation_level must be `:thread` or `:fiber`, got: `#{level.inspect}`"
        end

        if level != isolation_level
          clear
          singleton_class.alias_method(:current, "current_#{level}")
          singleton_class.send(:private, :current)
          @isolation_level = level
        end
      end

      def [](key)
        current[key]
      end

      def []=(key, value)
        current[key] = value
      end

      def clear
        current.clear
      end

      private
        def current_thread
          Thread.current.active_support_execution_state ||= {}
        end

        def current_fiber
          Fiber.current.active_support_execution_state ||= {}
        end

        alias_method :current, :current_thread
    end
  end
end
