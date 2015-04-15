class ExperiencesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
		@title = t("title.experiences")
		@subtitle = t("subtitle.experiences.index")
    @experiences = Experience.all.order('begin_date DESC').reject { |e| e.begin_date > DateTime.now }
    respond_with(@experiences)
  end

  def show
    @skills = @experience.skills.order("name ASC")
    @projects = @experience.projects.order("title ASC")
		@title = @experience.title
		@subtitle = @experience.title
    respond_with(@experience)
  end

  def new
    @title = t("title.experiences")
		@subtitle = t("subtitle.experiences.new")
    @experience = Experience.new
    respond_with(@experience)
  end

  def edit
    @title = @experience.title
    @subtitle = t("subtitle.experiences.edit")
  end

  def create
    @title = t("title.experiences")
		@subtitle = t("subtitle.experiences.new")
    @experience = Experience.new(experience_params)
    if @experience.save
      respond_with(@experience)
    else
      render 'new'
    end
  end

  def update
    @title = @experience.title
    @subtitle = t("subtitle.experiences.edit")
    if @experience.update(experience_params)
      respond_with(@experience)
    else
      render 'edit'
    end
  end

  def destroy
    @experience.destroy
    respond_with(@experience)
  end

  private
    def set_experience
      @experience = Experience.find(params[:id])
    end

    def experience_params
      params.require(:experience).permit(:title, :place, :country, :company, :logo, :image, :begin_date, :end_date, :description, :short_description, :type_id, :skill_ids => [], translations_attributes: [:id, :locale, :title, :place, :company, :country, :description, :short_description])
    end
end
