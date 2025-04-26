class CreateOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :options, comment: "Question options table" do |t|
      t.text :text, comment: "The Option itself"
      t.integer :position, comment: "The position in referred question options list"
      t.references :question, comment: "Belongs to Question"

      t.timestamps
    end
  end
end
