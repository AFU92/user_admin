class PreferencesController < ApplicationController
  before_action :set_preference, only: [:show, :update, :destroy]
  before_action :set_user

  # GET /users/#{user.id}/preferences
  def index
    @preferences = @user.preferences.all
    render json: @preferences
  end

  # GET /users/#{user.id}/preferences/1
  def show
    render json: @preference
  end

  # POST /users/#{user.id}/preferences
  def create
    @preference = @user.preferences.build(preference_params)

    if @preference.save
      render json: @preference, status: :created
    else
      render json: @preference.errors, status: :unprocessable_entity
    end

  end

  # PUT /users/#{user.id}/preferences/1
  def update
    if @preference.update(preference_params)
      render json: @preference
    else
      render json: @preference.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/#{user.id}/preferences/1
  def destroy
    @preference.destroy
  end

  private

  def set_preference
    set_user
    @preference = @user.preferences.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def preference_params
    params.require(:preference).permit(:description, data: [])
  end
end