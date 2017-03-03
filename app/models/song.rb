class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validate :released_year_valid?



  private

  def released_year_valid?
    current_year = Time.now.year
    if self.released
      if self.release_year==nil || !(self.release_year <= current_year)
        self.errors.add(:release_year, :invalid_year, message: "must be a year before current year")
      end
    end
    # binding.pry
  end

end
