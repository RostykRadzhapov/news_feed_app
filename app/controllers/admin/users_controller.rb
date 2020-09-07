# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    load_and_authorize_resource
    before_action :set_user, only: %i[show edit update destroy]

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def edit
      set_user
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_users_path, notice: 'User successfuly created'
      else
        render 'new', notice: 'User not created'
      end
    end

    def update
      set_user

      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'User successfuly updated'
      else
        render 'edit', notice: 'User not updated'
      end
    end

    def destroy
      redirect_to admin_users_path, notice: 'User deleted' if @user.destroy
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
