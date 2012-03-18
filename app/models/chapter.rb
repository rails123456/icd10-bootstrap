class Chapter < ActiveRecord::Base
  validates_presence_of :chap_no, :chap_title

  has_many :blocks
end
