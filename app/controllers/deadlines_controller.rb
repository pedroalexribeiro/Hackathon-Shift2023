# frozen_string_literal: true

class DeadlinesController < ApplicationController
  before_action :set_project
  before_action :set_client
  before_action :set_deadline, only: %i[show]

  def new
    @deadline = Deadline.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    service = CreateDeadlineService.call(@project, deadline_params)

    if service.valid?
      @deadline = service.result[:value]
      respond_to do |format|
        format.html { redirect_to client_project_path(@client, @project) }
      end
    else
      flash[:alert] = service.errors
    end
  end

  # Workaround, lack of time
  def show
    if @deadline.finalised?
      @deadline.going!
    else
      @deadline.finalised!
    end
    redirect_to client_project_path(@client, @project)
  end

  private

  def deadline_params
    params.require(:deadline).permit(:name)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_client
    @client = Client.find(params[:client_id])
  end

  def set_deadline
    @deadline = Deadline.find(params[:id])
  end
end
