class Client <ActiveRecord::Base
    has_many :rentals
    has_many :vhs, through: :rentals

    def self.first_rental(name, home_address, vhs)
        new_client = Client.new(name: name, home_address: home_address)
        Rental.create(vhs_id: vhs.id, current: true, client_id: new_client.id)
    end  

    # def current_rentals
    #     Rental.all.where{|rental| rental.client_id == self.id}
    # end

    def return_all
        binding.pry
        self.rentals.where(vhs_id: vhs.ids).update(current: false) 
    end 

    def number_of_rentals 
        self.rentals.count
    end 

    def self.paid_most 
        self 
        place_holder = 0
        self.number_of_rentals
        binding.pry
    end
end    