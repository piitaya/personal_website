class Contact < MailForm::Base
  attribute :object,    :validate => true
  attribute :email,     :validate => true
  attribute :message,   :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Site personnel : " + %(#{object}),
      :to => "paul.bottein@gmail.com",
      :from => %(<#{email}>)
    }
  end
end