class Specialty < ActiveRecord::Base
  has_many :qandas
  has_many :faqs
  belongs_to :user
end
