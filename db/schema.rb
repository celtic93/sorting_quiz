# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_25_175833) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "options", comment: "Question options table", force: :cascade do |t|
    t.text "text", comment: "The Option itself"
    t.integer "position", comment: "The position in referred question options list"
    t.bigint "question_id", comment: "Belongs to Question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", comment: "Questions table", force: :cascade do |t|
    t.text "text", comment: "The Question itself"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "round_options", comment: "Join table for Round Question and its Options", force: :cascade do |t|
    t.bigint "round_question_id", comment: "Belongs to Round Question"
    t.bigint "option_id", comment: "Belongs to Option"
    t.integer "position", comment: "Defines the order in which the Option is shown in Round Question"
    t.integer "correct_position", comment: "Stores value of correct position in Round Question.\n                                             Its different from original Option position"
    t.integer "user_position", comment: "Stores value of user answered position in Round Question"
    t.boolean "correct", default: false, comment: "Compares correct_position and user_position"
    t.integer "score", default: 0, comment: "Number of points given for the correct answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_round_options_on_option_id"
    t.index ["round_question_id"], name: "index_round_options_on_round_question_id"
  end

  create_table "round_questions", comment: "Join table for Rounds and Questions", force: :cascade do |t|
    t.bigint "round_id", comment: "Belongs to Round"
    t.bigint "question_id", comment: "Belongs to Question"
    t.integer "position", comment: "Defines the order in which the Question is shown in Round"
    t.boolean "done", default: false, comment: "Becomes true when all players give all answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_round_questions_on_question_id"
    t.index ["round_id"], name: "index_round_questions_on_round_id"
  end

  create_table "rounds", comment: "Rounds table", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
