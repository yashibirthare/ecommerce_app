class HomesController < ApplicationController
  def index
    # @products = Product.all
    @categories = Category.main_c

    category = Category.find_by(id: params[:category_id])
    @products = category.present? ? category.products : Product.all


  end
end
