ActiveAdmin.register Lecture do
  permit_params :course_id, :user_id, :content, :attachment
  index do
    selectable_column
    column :id
    column 'Content', Lecture.ids.each do |f|
      raw f.content
    end
    column :user
    column :course
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user
      row :content do
        raw Lecture.find(params[:id]).content
      end
      row :attachment_in_database
      row :course
      row :created_at
      row :comment
    end
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :course
      f.input :content, as: :ckeditor
      f.input :attachment
    end
    f.actions
  end
end
