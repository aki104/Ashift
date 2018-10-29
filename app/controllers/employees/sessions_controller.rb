# frozen_string_literal: true

class Employees::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # def after_sign_in_path_for(resource)
  #   if DateTable.exists?(employee_id: current_employee.id)
  #     date = DateTable.find_by(employee_id: current_employee.id)
  #     edit_date_table_path(date.id)
  #    # if date_tables = current_employee.id.presence
  #   #  puts current_employee.id
  #   #  if DateTable.exists?(employee_id: current_employee.id)
  #   #   edit_date_table_path(current_employee.id)
  #   # else
  #    # new_date_table_path(current_employee.id)
  #   end
  # end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end


  # GET /resource/sign_in
  # def new
  #   super
  # end
def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
       if DateTable.exists?(employee_id: current_employee.id)
          date = DateTable.find_by(employee_id: current_employee.id)
      # if TimeTable.exists?(date_table_id: )
       redirect_to edit_date_table_path(date.id)
      else
     redirect_to new_date_table_path(current_employee.id)
    end
    # respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
