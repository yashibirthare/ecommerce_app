ActiveAdmin.register Category do

  permit_params :name, :category_id

    index do
      selectable_column
      id_column
      column :name
      column :category
      column :created_at
      actions
    end

    form do |f|
      f.inputs do
        f.input :name
        f.input :category_id, as: :select, collection: Category.main_c
      end
      f.actions
    end
  
end
