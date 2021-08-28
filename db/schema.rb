ActiveRecord::Schema.define(version: 2021_08_28_101548) do

  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.float "price"
    t.string "name"
    t.boolean "real"
    t.float "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
