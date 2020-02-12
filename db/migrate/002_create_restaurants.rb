class CreateRestaurants < ActiveRecord::Migration[5.2]

    def change 
        create_table :restaurants do |t|
            t.string :restaurant_name
            t.string :address
            t.string :city
            t.string :type_of_food
        end
    end

end
