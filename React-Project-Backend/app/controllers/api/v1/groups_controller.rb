class Api::V1::GroupsController < ApplicationController
    before_action :find_group, only: [:update]

    def index
      @groups = Group.all
      render json: @groups
    end

    def show
        @group = Group.find(params[:id])
        render json: @group
    end 

    def create
        @group = Group.new(group_params)
        if @group.save
            render json: @group, status: :accepted
        else 
            render json: { errors: @group.errors.full_messages }, status: :unprocessible_entity
        end 
    end 
   
    def update
      @group.update(group_params)
      if @group.save
        render json: @group, status: :accepted
      else
        render json: { errors: @group.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def destroy
        @group = Group.find(params[:id])
        @group.destory 
    end 
   
    private
   
    def group_params
      params.permit(:name)
    end
   
    def find_group
      @group = Group.find(params[:id])
    end
end
