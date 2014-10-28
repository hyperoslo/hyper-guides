class GuidesController < ApplicationController
  def show
    @guide = Guide.published.friendly.find params[:id]
  end
end
