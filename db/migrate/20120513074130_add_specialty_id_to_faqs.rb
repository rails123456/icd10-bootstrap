class AddSpecialtyIdToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :specialty_id, :integer
  end
end
