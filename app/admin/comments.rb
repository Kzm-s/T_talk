ActiveAdmin.register Comment do

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: ['open', 'hidden']
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :post_id, :user_id, :comment_content, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:post_id, :user_id, :comment_content, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
