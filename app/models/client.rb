class Client <ActiveRecord::Base
    has_many :rentals
    has_many :vhs, through: :rentals

    def current_rentals
        Rental.all.select{|rental| rental.client_id == self.id}
    end

    def return_all
        binding.pry 
        self.current_rentals.current = false
    end 

end    