class RenameAddressColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
  	rename_column :addresses, :address, :delivery
  end
end
