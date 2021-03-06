class BlogsController < ApplicationController
  
  def index
    @blogs = Blog.all
    @user = current_user
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
    @comments = @blog.comments
    @comment = @blog.comments.build
  end

  def create
    @blog = Blog.new(blog_parameter)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path
    else
      rendar :new
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])

  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :blog_image, :user_id, :start_time)
  end

end
