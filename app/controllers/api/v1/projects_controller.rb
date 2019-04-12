class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_request
  before_action :set_project, only: [:show, :update, :destroy]
  
  def index
    @projects = Project.where(user_id:@current_user.id)
    render json: @projects
  end
  
  def show
   render json: @project
  end
  
  def create
   @project = Project.new(project_params.merge(user_id:@current_user.id))
   if @project.save
    render json: @project, status: :created, location:        api_v1_project_url(@project)
   else
    render json: @project.errors, status: :unprocessable_entity
   end
  end
  
  def update
   if @project.update(project_params)
    render json: @project
   else
    render json: @project.errors, status: :unprocessable_entity
   end
  end
 
  def destroy
    if @project.destroy
      render json: {status:"Project successfully deleted"}
    end
  end
  
  private
  
  def set_project
   @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:id,:project_name,:project_url,:user_id,:template_id)
  end
end
