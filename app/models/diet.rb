class Diet < ApplicationRecord
  after_initialize :default_values
  belongs_to :client

  def save_goal(goal)
    update(goal: goal)
  end

  def save_client_data(client_height, client_weight)
    update(client_height: client_height, client_weight: client_weight)
  end

  def save_effort(effort)
    update(effort: effort)
  end

  def calculate_kcal
    self.kcal = client_height * client_weight * 0.4 * effort + 500 * goal
    save
  end

  def calculate_macronutrients
    self.protein = 100 + 50 * goal
    self.carbohydrates = 100 + 70 * goal
    self.fat = 70 + 50 * goal
    save
  end

  private

  def default_values
    self.description ||= 'Dokładna treść diety wraz z produktami, które należy spożywać.'
  end
end
