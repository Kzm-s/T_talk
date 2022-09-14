ActiveAdmin.register Notice do
    permit_params :title, :content

  index do
    column :id
    column "タイトル", :title
    column "内容", :content
    column "作成日時", :create_at
    column "更新日時", :update_at 
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :content
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :content]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
