class Client <ActiveRecord::Base
    has_many :rentals
    has_many :vhs, through: :rentals

    def self.first_rental(name, home_address, vhs)
        new_client = Client.new(name: name, home_address: home_address)
        Rental.create(vhs_id: vhs.id, current: true, client_id: new_client.id)
    end  

    def return_all
        binding.pry
        self.rentals.where(vhs_id: vhs.ids).update(current: false) 
    end 

    def money_spent 
        number_of_rentals = self.rentals.count 
        (5.35 * number_of_rentals).round(2) 
    end 

    def self.paid_most
        Client.all.max_by{|client|client.number_of_rentals}
        
    end
end    