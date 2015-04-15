class CategoriesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_category, only: [:edit, :update, :destroy]

  respond_to :html

  def new
    @category = Category.new
    @title = t("title.admin")
		@subtitle = t("subtitle.categories.new")
    respond_with(@category)
  end

  def edit
    @title = @category.name
		@subtitle = t("subtitle.categories.edit")
  end

  def create
    @title = t("title.admin")
		@subtitle = t("subtitle.categories.new")
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    @title = @category.name
		@subtitle = t("subtitle.categories.edit")
    if @category.update(category_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :order_display, :style_icon, translations_attributes: [:id, :locale, :name])
    end
end
