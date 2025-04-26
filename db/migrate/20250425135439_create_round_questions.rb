class CreateRoundQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :round_questions, comment: "Join table for Rounds and Questions" do |t|
      t.references :round, comment: "Belongs to Round"
      t.references :question, comment: "Belongs to Question"

      t.timestamps
    end
  end
end
