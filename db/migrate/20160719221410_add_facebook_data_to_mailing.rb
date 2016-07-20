class AddFacebookDataToMailing < ActiveRecord::Migration
  def change
    add_column :mailings, :facebook_id, :string
    add_column :mailings, :facebook_friends, :integer
    add_column :mailings, :facebook_profile_image_url, :string
  end
end
