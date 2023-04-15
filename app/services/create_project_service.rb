class CreateProjectService < ApplicationService
  attr_accessor :client, :params

  def initialize(client, params)
    super()
    @client = client
    @params = params
  end

  def call
    project = Project.new(params)
    project.client = client
    raise CreateClientServiceError unless project.save

    result[:value] = project
  end

  class CreateProjectServiceError; end
end
