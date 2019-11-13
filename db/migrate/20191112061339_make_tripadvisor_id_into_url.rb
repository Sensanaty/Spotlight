class MakeTripadvisorIdIntoUrl < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :tripadvisor_id, :tripadvisor_url
  end
end
