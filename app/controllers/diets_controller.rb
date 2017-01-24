class DietsController < ApplicationController
  before_filter :authenticate_client!
  before_filter :set_diet, except: [:create]

  def create
    diet = current_client.diets.create
    redirect_to goal_diet_path(diet)
  end

  def goal
  end

  def save_goal
    @diet.save_goal(diet_params[:goal])
    redirect_to client_data_diet_path(@diet)
  end

  def client_data
  end

  def profile_diet
  end

  def save_client_data
    @diet.save_client_data(diet_params[:client_height], diet_params[:client_weight])
    redirect_to effort_diet_path(@diet)
  end

  def effort
  end

  def save_effort
    @diet.save_effort(diet_params[:effort])
    @diet.calculate_kcal
    @diet.calculate_macronutrients
    redirect_to preview_diet_path(@diet)
  end

  def preview
  end

  def submit_plan
    redirect_to profile_diet_path
  end

  def discard_plan
    @diet.remove_macronutrients_and_kcal
    redirect_to root_path
  end

  private

  def set_diet
    @diet = current_client.diets.find(params[:id])
  end

  def diet_params
    params
      .require(:diet)
      .permit(:goal, :client_height, :client_weight, :effort)
  end
end
