ActiveAdmin.register User do
  permit_params :email, :name, :gender, :date_of_birth, :avatar,:encrypted_password

  index do
    selectable_column
    column :id
    column :name
    column :email
    column :date_of_birth
    column :gender
    column :avatar
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
      row :gender
      row :created_at
      row :avatar
    end
  end

  form title:'New User' do |f|
    f.inputs  do
    input :name
    input :email
    input :date_of_birth
    input :gender
    input :avatar
    input :encrypted_password
    f.actions
    end
  end

end
