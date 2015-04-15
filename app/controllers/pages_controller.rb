class PagesController < ApplicationController
  include ApplicationHelper
  
  def home
    @title = t("title.home")
		@subtitle = t("subtitle.home")
    filename = File.join(Rails.root, 'public/pages/' + I18n.locale.to_s + '/home.md')
    file = File.open(filename, "r:UTF-8")
    @content = mark_down file.read
  end
  
  def admin
    @title = t("title.admin")
		@subtitle = t("subtitle.admin")
    authorize! :update, @category
    authorize! :update, @type
    @types = Type.all.order("name ASC")
    @categories = Category.all.order("order_display ASC")
  end
end