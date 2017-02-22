class Book < ApplicationRecord

  validates_uniqueness_of :isbn
end
