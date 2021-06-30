class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :screen

  has_many :bookings

  # scope :endtime => self.time + (self.movie.runtime * 60)

  before_save do
    @shows = Show.where(screen: self.screen, date: self.date)
    @shows.each do |show|
      if show.time == self.time
        puts "Screen already occupied"
      end
      if ((self.time - show.time) * 24 * 60).to_i >= self.movies.runtime
        puts "Screen already occupied"
      end
    end
  end

end
