class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_blog, only: [:new, :create, :edit, :update, :destroy]

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @blog, notice: 'Comment was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @blog, notice: 'Comment was successfully updated.' }
        format.js { render js: "window.location.href = '/blogs/#{@blog.id}'" }
      else
        format.html { redirect_to @blog, notice: 'Comment update failed.' }
        format.js { render js: "window.location.href = '/blogs/#{@blog.id}'" }
      end
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to @blog, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_blog
      @blog = Blog.find(params[:blog_id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:text, :blog_id, :user_id).merge(user_id: current_user.id, blog_id: @blog.id)
    end
end
