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
        user.restaurants.each{|restaurant| rows << [restaurant.restaurant_name,restaurant.location,restaurant.type_of_food]}
        table = Terminal::Table.new :headings => ["Restaurant".light_blue,"Location".light_blue,"Food Type".light_blue], :rows => rows.uniq
        puts table
    end

    def delete_from_lists(restaurant_name)
        restaurant = restaurants.find_by(restaurant_name: restaurant_name)
        restaurants.destroy(restaurant.id)
    end
end