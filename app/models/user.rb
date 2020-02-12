
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

    def clear_table
        user = User.find(self.id)
        user.restaurants.destroy_all
        print_out_list
    end

    def delete_all_restaurants_in_city(city_name)
        restaurants.where(city: city_name).destroy_all
        print_out_list
    end

    def delete_from_lists(restaurant_name)
        restaurants.destroy(id)
        print_out_list
    end
    def clear_table
        restaurants.delete_all
    end
    def delete_all_restaurant_by_location(restaurant_city)
        restaurants.where(city: restaurant_city).destroy_all
    end

end