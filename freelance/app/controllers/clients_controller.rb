# frozen_string_literal: true

class ClientsController < ApplicationController
  layout 'client_view', only: %i[show]
  before_action :set_client, only: %i[show]

  def index
    @client = Client.new
    @clients = Client.all
  end

  def new
    @client = Client.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    service = CreateClientService.call(current_freelancer, client_params)

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

  def client_params
    params.require(:client).permit(:name)
  end

  def set_client
    @client = Client.find(params[:id])
  end
end
