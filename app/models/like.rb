class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  def ulike
    User.find_by(id: self.user_id)
  end
end
