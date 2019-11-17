# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_13_023727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "epiphany_analyzers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "voice_assistant_id", null: false
    t.integer "entity_type_id"
    t.text "rules", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_type_id", "voice_assistant_id"], name: "epiphany_analyzers_entity_type_id_voice_assistant_id_idx"
    t.index ["entity_type_id"], name: "epiphany_analyzers_entity_type_id_idx"
    t.index ["name", "entity_type_id"], name: "epiphany_analyzers_name_entity_type_id_idx"
    t.index ["name"], name: "epiphany_analyzers_name_idx"
    t.index ["voice_assistant_id", "name", "entity_type_id"], name: "epiphany_analyzers_voice_assistant_id_name_entity_type_id_idx"
    t.index ["voice_assistant_id", "name"], name: "epiphany_analyzers_voice_assistant_id_name_idx"
    t.index ["voice_assistant_id"], name: "epiphany_analyzers_voice_assistant_id_idx"
  end

  create_table "epiphany_entity_items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "entity_type_id", null: false
    t.text "variations", default: [], array: true
    t.jsonb "metadata", default: "{}", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["entity_type_id", "name"], name: "epiphany_entity_items_name_entity_type_id_idx"
    t.index ["entity_type_id"], name: "epiphany_entity_items_entity_type_id_idx"
    t.index ["name"], name: "epiphany_entity_items_name_idx"
  end

  create_table "epiphany_entity_types", force: :cascade do |t|
    t.string "name", null: false
    t.integer "voice_assistant_id", null: false
    t.integer "analyzer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["analyzer_id", "voice_assistant_id"], name: "epiphany_entity_types_voice_assistant_analyzer_idx"
    t.index ["analyzer_id"], name: "epiphany_entity_types_analyzer_idx"
    t.index ["name", "analyzer_id"], name: "epiphany_entity_types_name_analyzer_idx"
    t.index ["name"], name: "epiphany_entity_types_name_idx"
    t.index ["voice_assistant_id", "name", "analyzer_id"], name: "epiphany_entity_types_voice_assistant_id_name_analyzer_idx"
    t.index ["voice_assistant_id", "name"], name: "epiphany_entity_types_voice_assistant_id_name_idx"
    t.index ["voice_assistant_id"], name: "epiphany_entity_types_voice_assistant_id_idx"
  end

  create_table "epiphany_intents", force: :cascade do |t|
    t.string "name", null: false
    t.integer "voice_assistant_id", null: false
    t.text "rules", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "epiphany_intents_name_idx"
    t.index ["voice_assistant_id", "name"], name: "epiphany_intents_voice_assistant_name_id_idx"
    t.index ["voice_assistant_id"], name: "epiphany_intents_voice_assistant_id_idx"
  end

  create_table "epiphany_training_phrases", force: :cascade do |t|
    t.text "phrase", null: false
    t.integer "voice_assistant_id", null: false
    t.text "metadata", default: "{}"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phrase"], name: "epiphany_training_phrases_idx"
    t.index ["voice_assistant_id", "phrase"], name: "epiphany_training_phrases_name_voice_assistant_id_idx"
    t.index ["voice_assistant_id"], name: "epiphany_training_voice_assistant_id_idx"
  end

  create_table "epiphany_voice_assistants", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "epiphany_voice_assistants_name_idx"
  end

end
