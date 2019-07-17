class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :credit_card_number

      t.timestamps
    end
  end
end
