class RemoveStyleFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :style
  end
end
