ActiveAdmin.register Product do

 permit_params :name, :price,:quantity,product_images: [], category_ids: []

    index do
      selectable_column
      id_column
      column :name
      column :price
      column :categories
      column :quantity
      column :created_at
      column "product_images" do |img|
        ul do
          img.product_images.each do |photo|
            li do
              image_tag url_for(photo), size: "100x100"
            end
          end
        end
      end
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
        f.input :product_images, as: :file, input_html: { multiple: true }
      end
      f.actions
    end
    show do
      attributes_table do
        row :name
        row :price
        row :categories
        row :quantity
        row :created_at
        row :product_images do
          div do
            product.product_images.each do |img|
              div do
                image_tag url_for(img), size: "200x200"
              end
            end
          end
        end
      end
    end
end
