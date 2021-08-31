ActiveAdmin.register Order do

    index do
      selectable_column
      id_column
      column :user_id
      column :payment_id
      column :amount
      column :status
      column :created_at
      actions
    end
  
end