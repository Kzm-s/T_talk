ActiveAdmin.register Post do
  permit_params :status

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: ['open', 'hidden']
    end
    f.actions
  end

  show do
    attributes_table do
      row :user
      row :post_type
      row :title
      row :content
      row :image do |ad|
        if post.image?
          image_tag ad.image.url, size: '280x240'
        end
      end
      row :status
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :post_type, :title, :content, :image, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :post_type, :title, :content, :image, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
