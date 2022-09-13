class Admin::UsersController < ApplicationController
    before_action :if_not_admin
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            redirect_to admin_users_path, notice: 'ユーザーを削除しました'
        else
            flash.now[:danger] = '削除に失敗しました'
            render :show
        end
    end
    private

    def if_not_admin
        redirect_to root_path unless current_user.admin?
    end

end