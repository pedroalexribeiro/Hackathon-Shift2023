# frozen_string_literal: true

class DeadlinesController < ApplicationController
  before_action :set_project
  before_action :set_client

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
      @client = service.result[:value]
      respond_to do |format|
        format.html { redirect_to clients_path }
      end
    else
      flash[:alert] = service.errors
    end
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
end
