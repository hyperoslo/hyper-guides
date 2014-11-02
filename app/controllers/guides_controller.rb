class GuidesController < ApplicationController
  include AngularBootstrapper

  respond_to :html, :json

  def index
    scope = current_user ? Guide.all : Guide.published

    @guides = scope.order published_at: :desc

    respond_with @guides
  end

  def show
    scope = current_user ? Guide.all : Guide.published

    @guide = scope.friendly.find params[:id]

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

  def destroy
    @guide = Guide.friendly.find params[:id]

    authorize! :destroy, @guide

    @guide.destroy

    respond_with @guide
  end

  private

  def guide_params
    params.require(:guide)
      .permit(:title, :slug, :short_description, :body, :published_at)
  end
end
