class Book < ApplicationRecord

  # normalize datetime
  def show_release_date
    release_date.strftime("%F %T")
  end

  validates_uniqueness_of :isbn
end
