ActiveAdmin.register User do
    actions :index, :show
    
    index do
      selectable_column
      id_column
      column :name
      column :email
      column :phone
      column :address
      column :created_at
      actions
    end
  
end
