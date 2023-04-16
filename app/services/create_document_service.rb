class CreateDocumentService < ApplicationService
  attr_accessor :params, :author, :source

  def initialize(params, author, source)
    super()
    @params = params
    @author = author
    @source = source
  end

  def call
    document = Document.new(params)
    document.name = params[:file].original_filename
    document.author = author
    # Workaround for passing params from the FE
    document.source = source
    raise CreateDocumentServiceError unless document.save

    result[:value] = document
  end

  class CreateDocumentServiceError < BaseError; end
end
