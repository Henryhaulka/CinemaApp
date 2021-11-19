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

ActiveRecord::Schema.define(version: 20_211_118_215_005) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'categorizations', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_categorizations_on_category_id'
    t.index ['movie_id'], name: 'index_categorizations_on_movie_id'
  end

  create_table 'comments', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.text 'body'
    t.index ['movie_id'], name: 'index_comments_on_movie_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'movie_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['movie_id'], name: 'index_likes_on_movie_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'movies', force: :cascade do |t|
    t.string 'name'
    t.string 'location'
    t.decimal 'price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.datetime 'viewing_date'
    t.text 'description'
    t.string 'avatar', default: 'default_avatar.jpg'
    t.integer 'capacity', default: 500
    t.string 'slug'
  end

  create_table 'registrations', force: :cascade do |t|
    t.string 'heard'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'movie_id', null: false
    t.integer 'user_id'
    t.index ['movie_id'], name: 'index_registrations_on_movie_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.boolean 'admin', default: false
    t.string 'user_image'
  end

  add_foreign_key 'categorizations', 'categories'
  add_foreign_key 'categorizations', 'movies'
  add_foreign_key 'comments', 'movies'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'likes', 'movies'
  add_foreign_key 'likes', 'users'
  add_foreign_key 'registrations', 'movies'
end
