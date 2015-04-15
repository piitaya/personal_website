class SkillsController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_skill, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @skills = Skill.all
		@categories = Category.all.order("order_display ASC")  
		@title = t("title.skills")
		@subtitle = t("subtitle.skills.index")
    respond_with(@skills)
  end

  def new
    @skill = Skill.new
    @title = t("title.skills")
		@subtitle = t("subtitle.skills.new")
    respond_with(@skill)
  end

  def edit
    @title = @skill.name
		@subtitle = t("subtitle.skills.edit")
  end

  def create
    @title = t("title.skills")
		@subtitle = t("subtitle.skills.new")
    @skill = Skill.new(skill_params)
    if @skill.save
      redirect_to skills_path
    else
      render 'new'
    end
  end

  def update
    @title = @skill.name
		@subtitle = t("subtitle.skills.edit")
    if @skill.update(skill_params)
      redirect_to skills_path
    else
      render 'edit'
    end
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  private
    def set_skill
      @skill = Skill.find(params[:id])
    end

    def skill_params
      params.require(:skill).permit(:name, :power, :category_id, :experience_ids => [], translations_attributes: [:id, :locale, :name])
    end
end
