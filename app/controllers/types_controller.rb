class TypesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def new
    @type = Type.new
    @title = t("title.admin")
		@subtitle = t("subtitle.types.new")
    respond_with(@type)
  end

  def edit
    @title = @type.name
		@subtitle = t("subtitle.types.edit")
  end

  def create
    @title = t("title.admin")
		@subtitle = t("subtitle.types.new")
    @type = Type.new(type_params)
    if @type.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def update
    @title = @type.name
		@subtitle = t("subtitle.types.edit")
    if @type.update(type_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  def destroy
    @type.destroy
    redirect_to admin_path
  end

  private
    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name, :style_icon, :style_color, translations_attributes: [:id, :locale, :name])
    end
end
