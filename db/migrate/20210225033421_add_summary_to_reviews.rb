class AddSummaryToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :summary, :string
  end
end
