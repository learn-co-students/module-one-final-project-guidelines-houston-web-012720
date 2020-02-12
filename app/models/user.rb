
class User < ActiveRecord::Base

    has_many :lists
    has_many :restaurants, through: :lists 

    def add_to_list(restaurant)
        List.create(restaurant_id: restaurant.id, user_id: self.id)

        print_out_list
    end

    def print_out_list
        rows = []
        user = User.find(self.id)
        user.restaurants.each{|restaurant| rows << [restaurant.id,restaurant.restaurant_name,restaurant.type_of_food,restaurant.city,restaurant.address]}
        table = Terminal::Table.new :headings => ["Id".light_blue,"Restaurant".light_blue,"Food Type".light_blue,"City".light_blue,"Address".light_blue], :rows => rows.uniq
        puts table
    end

    def delete_from_lists(id)
        restaurants.destroy(id)
        print_out_list
    end
end