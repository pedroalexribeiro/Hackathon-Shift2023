class CreateNoteService < ApplicationService
  attr_accessor :params, :author, :notable

  def initialize(params, author, notable)
    super()
    @params = params
    @author = author
    @notable = notable
  end

  def call
    note = Note.new(params)
    note.author = author
    # Workaround for passing params from the FE
    note.notable = notable
    raise CreateNoteServiceError unless note.save

    result[:value] = note
  end

  class CreateNoteServiceError < BaseError; end
end
