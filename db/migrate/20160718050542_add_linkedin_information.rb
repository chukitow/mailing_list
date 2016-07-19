class AddLinkedinInformation < ActiveRecord::Migration
  def change
    add_column :mailings, :linkedin_id, :string
    add_column :mailings, :linkedin_connections, :integer
    add_column :mailings, :linkedin_pictureUrl, :string
  end
end
