class Client <ActiveRecord::Base
    has_many :rentals
    has_many :vhs, through: :rentals

    def self.first_rental(name, home_address, vhs)
        new_client = Client.new(name: name, home_address: home_address)
        Rental.create(vhs_id: vhs.id, current: true, client_id: new_client.id)
    end    
    def current_rentals
        Rental.all.select{|rental| rental.client_id == self.id}
    end

    def return_all
        self.current_rentals.current = false
    end 

end    