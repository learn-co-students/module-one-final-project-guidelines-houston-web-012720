class CreateTrainer < ActiveRecord::Migration[5.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :area_id
  end
end
