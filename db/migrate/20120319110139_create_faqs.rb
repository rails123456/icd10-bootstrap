class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :faq_item
      t.string :faq_q
      t.string :faq_a
    end
  end
end
