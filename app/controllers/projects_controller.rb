# frozen_string_literal: true

class ProjectsController < ApplicationController
  layout 'project_view', only: %i[show]
  before_action :set_project, only: %i[show]
  before_action :set_client

  def index
    @project = Project.new
    @projects = Project.all
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    service = CreateProjectService.call(@client, project_params)

    if service.valid?
      @client = service.result[:value]
      respond_to do |format|
        format.html { redirect_to clients_path }
      end
    else
      flash[:alert] = service.errors
    end
  end

  def show; end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_client
    @client = Client.find(params[:client_id])
  end
end
