ActiveAdmin.register Order do
    actions :index, :show
    
    index do
      selectable_column
      id_column
      column :user
      column :payment_id
      column :amount
      column :status
      column :created_at
      actions
    end
  
end