class AddRemoteIdToTripadvisorReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :tripadvisor_reviews, :remote_id, :integer
  end
end
