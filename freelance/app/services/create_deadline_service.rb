class CreateDeadlineService < ApplicationService
  attr_accessor :project, :params

  def initialize(project, params)
    super()
    @project = project
    @params = params
  end

  def call
    deadline = Deadline.new(params)
    deadline.project = project
    raise CreateClientServiceError unless deadline.save

    result[:value] = deadline
  end

  class CreateDeadlineServiceError < BaseError; end
end
