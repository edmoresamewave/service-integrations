class WebhookConfigsController < ApplicationController
  def index
    @config = WebhookConfig.all
    render json: @config, status: :ok

  end

  def create
    @config =  WebhookConfig.create!(config_params)
    render json: @config, status: :created
  end

  private

  def config_params
    params.permit(:team_id, :integration_id, :stream_id, :url, :active)
  end
end
