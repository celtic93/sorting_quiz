class CreateRounds < ActiveRecord::Migration[8.0]
  def change
    create_table :rounds, comment: "Rounds table" do |t|
      t.timestamps
    end
  end
end
