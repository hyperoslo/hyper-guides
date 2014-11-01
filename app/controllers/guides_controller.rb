class GuidesController < ApplicationController
  include AngularBootstrapper

  respond_to :html, :json

  def show
    scope = if current_user
              Guide.friendly
            else
              Guide.published.friendly
            end

    @guide = scope.find params[:id]

    authorize! :show, @guide

    respond_with @guide
  end

  def new
    authorize! :create, Guide

    @guide = Guide.new

    respond_with @guide
  end

  def create
    authorize! :create, Guide

    @guide = Guide.new guide_params

    @guide.save

    respond_with @guide
  end

  def edit
    @guide = Guide.friendly.find params[:id]

    authorize! :edit, @guide

    respond_with @guide
  end

  def update
    @guide = Guide.friendly.find params[:id]

    authorize! :edit, @guide

    @guide.update guide_params

    respond_with @guide
  end

  private

  def guide_params
    params.require(:guide).permit(:title, :slug, :body, :published_at)
  end
end
