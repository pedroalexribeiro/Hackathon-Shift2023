class CreateDocumentService < ApplicationService
  attr_accessor :source, :params

  def initialize(source, params)
    super()
    @source = source
    @params = params
  end

  def call
    document = Document.new(params)
    raise CreateDocumentServiceError unless document.save

    result[:value] = document
  end

  class CreateDocumentServiceError; end
end
