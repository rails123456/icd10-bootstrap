class Block < ActiveRecord::Base
  validates_presence_of :block_no, :block_title

  belongs_to :chapter
end
