ActiveAdmin.register Lecture do
    permit_params :course_id, :user_id,:content,:attachment
    index do
    selectable_column
    column :id
    column :content
    column :user
    column :course
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user
      row :content
      row :attachment
      row :course
      row :created_at
    end
  end
end
