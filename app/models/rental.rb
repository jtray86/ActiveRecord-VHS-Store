class Rental < ActiveRecord::Base 
    belongs_to :client 
    belongs_to :vhs 

    def due_date
        d = self.created_at.to_date
        d + 7
    end   
    # def self.past_rentals_currently_available_vhs
    #     self.all.select{|rental| !rental.current}.map(&:vhs)
    # end
   
end 
