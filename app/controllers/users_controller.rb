class UsersController < ApplicationController
  def show
    @user = current_user
    @projects = policy_scope(Project).order(created_at: :desc)
    authorize @user
  end
end
