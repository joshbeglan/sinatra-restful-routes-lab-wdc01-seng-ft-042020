class ChangeRecipeColumnName < ActiveRecord::Migration
  def change
    change_column :recipes, :cooktime, :cook_time
  end
end
