class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @title = t("title.contact")
    @subtitle = t("subtitle.contact")
  end

  def create
    @title = t("title.contact")
    @subtitle = t("subtitle.contact")
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = t("contact.result.success")
    else
      flash.now[:danger] = t("contact.result.error")
    end
    render :index
  end
end