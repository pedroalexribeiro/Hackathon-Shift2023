class CreateClientService < ApplicationService
  attr_accessor :freelancer, :params

  def initialize(freelancer, params)
    super()
    @freelancer = freelancer
    @params = params
  end

  def call
    client = Client.new(params)
    client.freelancer = freelancer
    raise CreateClientServiceError unless client.save

    result[:value] = client
  end

  class CreateClientServiceError; end
end
