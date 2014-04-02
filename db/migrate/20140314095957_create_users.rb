

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pan
      t.string :designation
      t.string :pf
      t.date   :joined_at

      t.timestamps
    end
  end

end
