ActiveAdmin.register Order do
    actions :index, :show
    require 'easypost'
    EasyPost.api_key = 'EZTKa2e2c4cb9a784e6c93fb7ea2c0268adfWsbDQtaZS2RgHjDFUooIYg'

    member_action :payment_refund, method: :post do
      order = Order.find_by(id: params[:id])
      if order.present?
        payment = Razorpay::Payment.fetch(order.payment_id).refund({amount:500})
        if order.status == 'captured'
          order.status = 'refunded'
          order.save
        end
      end
    end

    member_action :order_shipping, method: :post do
      order = Order.find_by(id: params[:id])
      if order.present?
        user_order = order.user
        to_address = EasyPost::Address.create(
          name: user_order.name,
          email: user_order.email,
          city: user_order.address,
          phone: user_order.phone
        )
        from_address = EasyPost::Address.create(
          email: current_user
        )
        parcel = EasyPost::Parcel.create(
          width: 15.2,
          length: 18,
          height: 9.5,
          weight: 35.1
        )
        shipment = EasyPost::Shipment.create(
          to_address: to_address,
          from_address: from_address,
          parcel: parcel
        )
      end
    end
    
    index do
      selectable_column
      id_column
      column :user
      column :payment_id
      column :amount
      column :status
      column :created_at
      actions do |order|
        if order.status == 'captured'
          link_to("Refund", payment_refund_admin_order_path(order), method: :post) + " | " + 
          link_to("Shipping",order_shipping_admin_order_path(order), method: :post)
        elsif order.status == 'shipped'
          link_to("Track Order")
        end
      end
    end
end
