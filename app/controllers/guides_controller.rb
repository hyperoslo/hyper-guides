class GuidesController < ApplicationController
  respond_to :html, :json

  def show
    @guide = Guide.published.friendly.find params[:id]

    respond_with @guide
  end

  def new
    @guide = Guide.new

    respond_with @guide
  end
end
