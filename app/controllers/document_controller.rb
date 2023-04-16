# frozen_string_literal: true

class DocumentsController < ApplicationController
  before_action :set_source
  before_action :set_all_documents

  def new
    @document = Document.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    service = CreateDocumentService.call(document_params, current_freelancer, @source)

    if service.valid?
      @client = service.result[:value]
      redirect_to client_project_path(@source.project.client, @source.project)
    else
      flash[:alert] = service.errors
    end
  end

  private

  def document_params
    params.require(:document).permit(:name, :file)
  end

  def set_all_documents
    @documents = Document.where(source: @source)
  end

  def set_source
    @source = params[:source_type].camelcase.safe_constantize.find(params[:source_id])
  end
end
