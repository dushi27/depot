class ChangeProductImageUrl < ActiveRecord::Migration
  def change
    rename_column :products, :image_url, :image
    rename_column :orders, :address, :street_address
    add_column :orders, :city, :string
    add_column :orders, :zip, :string
  end
end
