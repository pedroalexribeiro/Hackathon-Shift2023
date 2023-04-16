# frozen_string_literal: true

class ApplicationService
  attr_accessor :errors, :result

  def self.call(*args, &block)
    service = new(*args, &block)
    begin
      service.call
    rescue BaseError => e
      service.errors << e
      handle_error(service.errors)
    end
    service
  end

  def self.handle_error(errors)
    puts errors
  end

  def initialize
    @errors = []
    @result = ActiveSupport::HashWithIndifferentAccess.new
  end

  def call
    raise NotImplementedError
  end

  def errors?
    errors.any?
  end

  def valid?
    errors.empty?
  end


  class BaseError < StandardError; end
end
