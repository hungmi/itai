class Contact < MailForm::Base
  attribute :company_name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :country,      :validate => true
  attribute :business_field,      :validate => true
  attribute :business_type
  attribute :job_title
  attribute :telephone,      :validate => true
  attribute :fax
  attribute :file, :attachment => true
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "H.C.H Contact Message",
      :to => "hungmihungmi@gmail.com",
      :from => %("#{company_name}" <#{email}>)
    }
  end

end