class Api::V1::NotebooksController < ApplicationController
    before_action :find_notebook, only: [:show, :update]

    def index
      @notebooks = Notebook.where(user_id: note_params[:user_id])
      render json: @notebooks
    end

    def show
        @notebook = Notebook.find(params[:id])
        render json: @notebook
    end 

    def create
        @notebook = Notebook.new(notebook_params)
        if @notebook.save
            render json: @notebook, status: :accepted
        else 
            render json: { errors: @notebook.errors.full_messages }, status: :unprocessible_entity
        end 
    end 
   
    def update
      @notebook.update(notebook_params)
      if @notebook.save
        render json: @notebook, status: :accepted
      else
        render json: { errors: @notebook.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def destroy
        @notebook = Notebook.find(params[:id])
        @notebook.destory 
    end 
   
    private
   
    def notebook_params
      params.permit(:id, :group_id, :title, :description)
    end
   
    def find_notebook
      @notebook = Notebook.find(params[:id])
    end
end
