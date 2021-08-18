ActiveAdmin.register Product do

 permit_params :name, :price,:quantity, category_ids: []

    index do
      selectable_column
      id_column
      column :name
      column :price
      column :categories
      column :quantity
      column :created_at
      actions
    end

    # filter :name
    # filter :price
    # filter :created_at

    form do |f|
      f.inputs do
        f.input :name
        f.input :price
        f.input :quantity
        f.input :categories, :as => :check_boxes
      end
      f.actions
    end
  
end
