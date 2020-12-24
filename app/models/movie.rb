class Movie < ActiveRecord::Base
    has_many :vhs 
    has_many :movie_genres 
    has_many :genres, through: :movie_genres

    def report_stolen 
        binding.pry
        
        self.vhs.rentals.current(current: false) 
        self.vhs.random.delete
    end 
end 