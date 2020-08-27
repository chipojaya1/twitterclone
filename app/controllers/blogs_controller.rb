class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blog = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "blog successfully created"
      else
        render :new
      end
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
    params.require(:blog).permit(:content)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
