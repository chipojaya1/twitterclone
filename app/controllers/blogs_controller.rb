class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all.order("created_at DESC")
  end
  def show
    @blog = Blog.find(params[:id])
    if @blog.show(blog_params)
      redirect_to new_blog_path
    else
       render :edit
     end
   end
  def new
    @blog = Blog.new
  end
  def edit
    @blog = Blog.find(params[:id])
  end
  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "blog successfullycreated!"
      else
        render :new
      end
    end
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
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_params
    params.require(:blog).permit(:blog)
  end
end
