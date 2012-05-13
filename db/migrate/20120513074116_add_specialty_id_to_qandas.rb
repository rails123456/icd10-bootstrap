class AddSpecialtyIdToQandas < ActiveRecord::Migration
  def change
    add_column :qandas, :specialty_id, :integer
  end
end
