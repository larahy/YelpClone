class AddMemberIdToReviews < ActiveRecord::Migration
  def change
    add_reference :reviews, :member, index: true
  end
end
