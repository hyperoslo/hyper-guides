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

  def create
    @guide = Guide.new guide_params

    @guide.save

    respond_with @guide
  end

  private

  def guide_params
    params.require(:guide).permit(:title, :slug, :body, :published_at)
  end
end
