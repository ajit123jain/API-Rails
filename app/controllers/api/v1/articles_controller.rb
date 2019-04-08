class Api::V1::ArticlesController < ApplicationController
  before_action :authorize_request
  before_action :set_article, only: [:show, :update, :destroy]
  # GET /articles
  def index
  # @articles = Article.all
  @articles = Article.where(user_id:@current_user.id)
   render json: @articles
  end
  # GET /articles/1
  def show
   render json: @article
  end
  # POST /articles
  def create
   @article = Article.new(article_params.merge(user_id:@current_user.id))
   if @article.save
    render json: @article, status: :created, location:        api_v1_article_url(@article)
   else
    render json: @article.errors, status: :unprocessable_entity
   end
  end
  # PATCH/PUT /articles/1
  def update
   if @article.update(article_params)
    render json: @article
   else
    render json: @article.errors, status: :unprocessable_entity
   end
  end
 # DELETE /articles/1
  def destroy
    if @article.destroy
      render json: {status:"Article successfully deleted"}
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
   @article = Article.find(params[:id])
  end
  # Only allow a trusted parameter “white list” through.
  def article_params
  params.require(:article).permit(:title, :content, :slug,:user_id,:id)
  end
  end
