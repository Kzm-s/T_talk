ActiveAdmin.register User do


  
  form do |f|
    panel '注意' do
      'ユーザー情報は編集できません'
    end
  end



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :name, :birth, :gender, :affiliation, :job_title, :career, :responsible, :subject, :grade, :other, :reset_password_token, :reset_password_sent_at, :remember_created_at, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :name, :birth, :gender, :affiliation, :job_title, :career, :responsible, :subject, :grade, :other, :reset_password_token, :reset_password_sent_at, :remember_created_at, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
