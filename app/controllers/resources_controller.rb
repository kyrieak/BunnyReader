class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
    render "index", layout: "resource_layout"
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def new
    @resource = Resource.new()
  end

  def create
    @resource = Resource.new(resource_params)
    @resource.save
    redirect_to controller: "resources", action: "index"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :author, :source_url, :main_source_name, :main_source_url, :note)
  end
end

