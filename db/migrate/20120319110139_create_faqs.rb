class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.string :faq_item
      t.text :faq_q
      t.text :faq_a
    end
  end
end
