# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_notable
  before_action :set_all_notes

  def new
    @note = Note.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    service = CreateNoteService.call(notes_params, current_freelancer, @notable)

    if service.valid?
      @client = service.result[:value]
      redirect_to client_project_path(@notable.project.client, @notable.project)
    else
      flash[:alert] = service.errors
    end
  end

  private

  def notes_params
    params.require(:note).permit(:content, :change)
  end

  def set_all_notes
    @notes = Note.where(notable: @notable)
  end

  def set_notable
    @notable = params[:notable_type].camelcase.safe_constantize.find(params[:notable_id])
  end
end
