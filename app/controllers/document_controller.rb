# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_all_documents

  def new
    @document = Document.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    set_notable
    service = CreateDocumentService.call(document_params, current_freelancer, @notable)

    if service.valid?
      @client = service.result[:value]
    else
      flash[:alert] = service.errors
    end
  end

  private

  def document_params
    params.require(:document).permit(:name)
  end

  def set_all_documents
    # @notes = Document.all.where(notable: )
  end

  def set_notable
    @notable = params[:notable_type].safe_constantize.find(params[:notable_id])
  end
end
