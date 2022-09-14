ActiveAdmin.register PostTag do

  form do |f|
    panel '注意' do
      'タグは編集できません'
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :post_id, :tag_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:post_id, :tag_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
