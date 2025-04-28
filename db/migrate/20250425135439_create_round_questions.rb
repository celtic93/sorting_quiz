class CreateRoundQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :round_questions, comment: "Join table for Rounds and Questions" do |t|
      t.references :round, comment: "Belongs to Round"
      t.references :question, comment: "Belongs to Question"
      t.integer :position, comment: "Defines the order in which the Question is shown in Round"
      t.boolean :done, default: false, comment: "Becomes true when all players give all answers"

      t.timestamps
    end
  end
end
