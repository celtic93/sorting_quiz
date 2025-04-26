class CreateRoundOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :round_options, comment: "Join table for Round Question and its Options" do |t|
      t.references :round_question, comment: "Belongs to Round Question"
      t.references :option, comment: "Belongs to Option"
      t.integer :position, comment: "Defines the order in which the Option is shown in Round Question"
      t.integer :correct_position, comment: "Stores value of correct position in Round Question.
                                             Its different from original Option position"
      t.integer :user_position, comment: "Stores value of user answered position in Round Question"
      t.boolean :correct, default: false, comment: "Compares correct_position and user_position"
      t.integer :score, default: 0, comment: "Number of points given for the correct answer"

      t.timestamps
    end
  end
end
