ActiveAdmin.register Course do
    permit_params :user_id, :title

    index do
        selectable_column
        column :id
        column :title
        column :user
        column :created_at
        actions
      end


      show do
        attributes_table do
          row :title
          row :user
          row :created_at
        end
      end
end
