class Api::V1::TemplatesController < ApplicationController
  before_action :admin_check
  before_action :set_template, only: [:show, :update, :destroy]
  # GET /articles
  def index
    @templates = Template.all
    render json: @templates
  end
  # GET /articles/1
  def show
   render json: @template
  end
  # POST /articles
  def create
   @template = Template.new(template_params)
   if @template.save
    render json: @template, status: :created, location:        api_v1_template_url(@template)
   else
    render json: @template.errors, status: :unprocessable_entity
   end
  end
  # PATCH/PUT /articles/1
  def update
   if @template.update(template_params)
    render json: @template
   else
    render json: @template.errors, status: :unprocessable_entity
   end
  end
 # DELETE /articles/1
  def destroy
    if @template.destroy
      render json: {status:"Template successfully deleted"}
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_template
   @template = Template.find(params[:id])
  end
  # Only allow a trusted parameter “white list” through.
  def template_params
  params.require(:template).permit(:title, :content, :slug,:id)
  end
end
