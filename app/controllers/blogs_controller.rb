class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
    @blog = Blog.new(blog_params)
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "blog successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "blog succefully updated!"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: "blog successfully deleted!"
  end

  def confirm
   @blog = Blog.new(blog_params)
   render :new if @blog.invalid?
  end

  private
  def blog_params
    params.require(:blog).permit(:blog)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
