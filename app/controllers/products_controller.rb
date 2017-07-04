class ProductsController < ApplicationController
  before_action :authorize, only: [:new, :edit, :destroy]

  def index

    @products = Product.all.paginate(:page => params[:page], :per_page => 10)
    if params[:filter] === "mostRecent"
      @products = Product.most_recent
    elsif params[:filter] === "alphabetical"
      @products = Product.alphabetical
    elsif params[:filter] === "local"
      @products = Product.local
    elsif params[:filter] === "most_reviews"
      @products = Product.most_reviews
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to  products_path
    else
      flash[:alert] = "Product save failed!"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully edited!"
      redirect_to products_path
    else
      flash[:alert] = "Product edit failed!"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product successfully deleted!"
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :price, :country, :picture, :description)
  end

end
