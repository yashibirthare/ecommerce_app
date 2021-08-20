class HomesController < ApplicationController
  def index
    @categories = Category.main_c
    category = Category.find_by(id: params[:category_id])
    @products = category.present? ? category.products : Product.all
    @cart = current_cart
  end
end
