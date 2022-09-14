ActiveAdmin.register Message do

  form do |f|
    panel '注意' do
      'メッセージは編集できません'
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :room_id, :content, :image, :is_check
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :room_id, :content, :image, :is_check]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
