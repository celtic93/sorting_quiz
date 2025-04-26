class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions, comment: "Questions table" do |t|
      t.text :text, comment: "The Question itself"

      t.timestamps
    end
  end
end
