# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_all_notes

  def new
    @note = Note.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    set_notable
    service = CreateNoteService.call(notes_params, current_freelancer, @notable)

    if service.valid?
      @client = service.result[:value]
      # should refresh the page
    else
      flash[:alert] = service.errors
    end
  end

  private

  def notes_params
    params.require(:note).permit(:content)
  end

  def set_all_notes
    @notes = Note.all
  end

  def set_notable
    @notable = params[:notable_type].camelcase.safe_constantize.find(params[:notable_id])
  end
end
