class ProductsController < ApplicationController
  def index
    #   @products = Product.all()
    @products = CategoryProduct.joins(:product,:category).select('products.id','products.name as productos','categories.name as categorias')
  end

  def new
    @product = Product.new
    @categorys = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.categoryProducts.create()
    # @product.save
    redirect_to '/products'
  end

  protected
    def product_params
      params.require(:product).permit(:name, :price)
    end
end

# select products.id,products.name,categories.name 
# from category_products
# inner join products on products.id = category_products.product_id
# inner join categories on categories.id = category_products.category_id
