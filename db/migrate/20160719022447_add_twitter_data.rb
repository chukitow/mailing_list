class AddTwitterData < ActiveRecord::Migration
  def change
    add_column :mailings, :twitter_id, :string
    add_column :mailings, :twitter_followers, :integer
    add_column :mailings, :twitter_follows, :integer
    add_column :mailings, :twitter_profile_image_url, :string
  end
end
