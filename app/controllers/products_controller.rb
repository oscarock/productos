class ProductsController < ApplicationController
  def index
    @products = Product.all()
    # pro3.categorys.pluck(:name).join(',')
    # @products = CategoryProduct.joins(:product,:category).select('products.id','products.name as productos','categories.name as categorias')
  end

  def new
    @product = Product.new
    @categories = Category.all
    @product.categories.new
    # @pro_cat = @product.categories.new
    # @category_products = @product.categorys
  end

  def create
    @product = Product.new(product_params)
    # @product.categories.new()
    @product.save
    redirect_to '/products'
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to '/products'
  end

    protected
    def product_params
      # debugger
      params.require(:product).permit(:name, :price, category_ids: [])
    end
end

# select products.id,products.name,categories.name
# from category_products
# inner join products on products.id = category_products.product_id
# inner join categories on categories.id = category_products.category_id
