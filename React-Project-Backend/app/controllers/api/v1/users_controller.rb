class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :find_user, only: [:update]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :accepted
    else 
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end 
  end 
 
  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy 
  end 
 
  private
 
  def user_params
    params.permit(:name, :email, :password)
  end
 
  def find_user
    @user = User.find(params[:id])
  end
end
