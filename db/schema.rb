# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090718111240) do

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "org_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deal_disclaimers", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "disclaimer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.integer  "org_id"
    t.string   "deal_type"
    t.string   "deal_value"
    t.string   "title"
    t.string   "description"
    t.integer  "rank",               :default => 0
    t.integer  "position"
    t.string   "photo_file_name"
    t.string   "deals"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "delta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "vote_status",        :default => 0
    t.boolean  "vote_flag",          :default => false
  end

  create_table "disclaimers", :force => true do |t|
    t.string "name", :limit => 200
  end

  create_table "events", :force => true do |t|
    t.integer  "org_id"
    t.string   "title"
    t.string   "description"
    t.string   "street"
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.datetime "starting_on"
    t.datetime "ending_on"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "age_requirement",    :default => "None"
    t.boolean  "delta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank",               :default => 0
    t.boolean  "vote",               :default => false
  end

  create_table "facts", :force => true do |t|
    t.integer  "org_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "delta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flowings", :force => true do |t|
    t.integer  "org_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "delta"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.integer  "org_id"
    t.string   "title"
    t.text     "content"
    t.integer  "position",     :default => 1,     :null => false
    t.integer  "photos_count", :default => 0,     :null => false
    t.boolean  "delta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",      :default => false
  end

  create_table "geocodes", :force => true do |t|
    t.decimal "latitude",    :precision => 15, :scale => 12
    t.decimal "longitude",   :precision => 15, :scale => 12
    t.string  "query"
    t.string  "street"
    t.string  "locality"
    t.string  "region"
    t.string  "postal_code"
    t.string  "country"
    t.string  "precision"
  end

  add_index "geocodes", ["country"], :name => "geocodes_country_index"
  add_index "geocodes", ["latitude"], :name => "geocodes_latitude_index"
  add_index "geocodes", ["locality"], :name => "geocodes_locality_index"
  add_index "geocodes", ["longitude"], :name => "geocodes_longitude_index"
  add_index "geocodes", ["postal_code"], :name => "geocodes_postal_code_index"
  add_index "geocodes", ["precision"], :name => "geocodes_precision_index"
  add_index "geocodes", ["query"], :name => "geocodes_query_index", :unique => true
  add_index "geocodes", ["region"], :name => "geocodes_region_index"

  create_table "geocodings", :force => true do |t|
    t.integer "geocodable_id"
    t.integer "geocode_id"
    t.string  "geocodable_type"
  end

  add_index "geocodings", ["geocodable_id"], :name => "geocodings_geocodable_id_index"
  add_index "geocodings", ["geocodable_type"], :name => "geocodings_geocodable_type_index"
  add_index "geocodings", ["geocode_id"], :name => "geocodings_geocode_id_index"

  create_table "highlights", :force => true do |t|
    t.integer  "org_id"
    t.string   "title"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tabid"
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "org_id"
    t.boolean  "promotion"
    t.boolean  "deal"
    t.boolean  "news"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orgs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "street"
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "url"
    t.string   "hq_url"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_email"
    t.string   "contact_phone_work"
    t.string   "contact_phone_cell"
    t.boolean  "is_authorized"
    t.boolean  "delta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating_count"
    t.integer  "rating_total",       :limit => 10,  :precision => 10, :scale => 0
    t.decimal  "rating_avg",                        :precision => 10, :scale => 2
    t.string   "contact_fax"
    t.string   "three_word_desc"
    t.boolean  "logo",                                                             :default => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "image_file_size"
    t.integer  "video_count",                                                      :default => 0
    t.string   "calendar",           :limit => 200
    t.boolean  "publish",                                                          :default => false
    t.boolean  "calender_status",                                                  :default => false
    t.boolean  "contact_24",                                                       :default => false
    t.boolean  "map_it",                                                           :default => false
    t.integer  "tab_count",                                                        :default => 0
  end

  create_table "photos", :force => true do |t|
    t.integer  "gallery_id",                                           :null => false
    t.integer  "position",                          :default => 1,     :null => false
    t.string   "title",              :limit => 128
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",                           :default => false
  end

  create_table "price_tabs", :force => true do |t|
    t.integer "org_id"
    t.string  "tab_name"
    t.integer "main_tab"
  end

  create_table "prices", :force => true do |t|
    t.integer  "org_id"
    t.string   "group"
    t.string   "title"
    t.integer  "price",              :limit => 10,  :precision => 10, :scale => 0
    t.text     "description"
    t.text     "content"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "string"
    t.integer  "photo_file_size"
    t.integer  "integer"
    t.datetime "photo_updated_at"
    t.datetime "datetime"
    t.integer  "position"
    t.boolean  "delta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item",               :limit => 200
    t.integer  "tab_id"
    t.integer  "main_tab"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "org_id",     :null => false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer "rater_id"
    t.integer "rated_id"
    t.string  "rated_type"
    t.integer "rating",     :limit => 10, :precision => 10, :scale => 0
  end

  add_index "ratings", ["rated_type", "rated_id"], :name => "index_ratings_on_rated_type_and_rated_id"
  add_index "ratings", ["rater_id"], :name => "index_ratings_on_rater_id"

  create_table "review_reports", :force => true do |t|
    t.integer  "review_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "org_id"
    t.string   "name"
    t.string   "town"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rank",       :default => 0
    t.boolean  "vote_flag",  :default => false
  end

  create_table "tabs", :force => true do |t|
    t.integer  "org_id"
    t.string   "title"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "street_2"
    t.string   "locality"
    t.string   "region"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone"
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "perishable_token",    :default => "",    :null => false
    t.string   "string",              :default => "",    :null => false
    t.boolean  "hq_staff",            :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sales_calender_vote", :default => false
    t.boolean  "hq_deal_vote",        :default => false
    t.boolean  "user_review_vote",    :default => false
  end

  create_table "video_requests", :force => true do |t|
    t.integer  "org_id"
    t.text     "content"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.integer  "org_id"
    t.boolean  "approve"
    t.boolean  "default",            :default => false
  end

end
