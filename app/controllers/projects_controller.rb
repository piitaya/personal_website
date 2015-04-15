class ProjectsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @title = t("title.projects")
		@subtitle = t("subtitle.projects.index")
    @projects = Project.all.order('order_display ASC')
    respond_with(@projects)
  end

  def show
    @title = @project.title
		@subtitle = @project.title
    respond_with(@project)
  end

  def new
    @title = t("title.projects")
		@subtitle = t("subtitle.projects.new")
    @project = Project.new
    respond_with(@project)
  end

  def edit
    @title = @project.title
		@subtitle = t("subtitle.projects.edit")
  end

  def create
    @title = t("title.projects")
		@subtitle = t("subtitle.projects.new")
    @project = Project.new(project_params)
    if @project.save
      respond_with(@project)
    else
      render 'new'
    end
  end

  def update
    @title = @project.title
		@subtitle = t("subtitle.projects.edit")
    if @project.update(project_params)
      respond_with(@project)
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :subtitle, :description, :short_description, :order_display, :experience_id, translations_attributes: [:id, :locale, :title, :subtitle, :description, :short_description])
    end
end
