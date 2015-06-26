class RegistrationsController < Devise::RegistrationsController
  private
 
  def sign_up_params
    params.require(:customer).permit(:company_name, :email, :password, :password_confirmation, :country_code, :business_field, :business_type, :job_title, :telephone, :fax, :humanizer_answer, :humanizer_question_id)
  end
 
  def account_update_params
    params.require(:customer).permit(:company_name, :email, :password, :password_confirmation, :country_code, :business_field, :business_type, :job_title, :telephone, :fax, :current_password, :humanizer_answer, :humanizer_question_id)
  end
end