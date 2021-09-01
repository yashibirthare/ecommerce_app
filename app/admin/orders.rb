ActiveAdmin.register Order do
    actions :index, :show
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
          link_to("Refund", payment_refund_admin_order_path(order), method: :post)
        end
      end
    end
end