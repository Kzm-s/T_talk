ActiveAdmin.register Relationship do

  form do |f|
    panel '注意' do
      'フォロー・フォロワーは編集できません'
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :follow_id, :follower_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:follow_id, :follower_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
