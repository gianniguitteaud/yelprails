class Restaurant < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true
  validates :description, presence: true

  def average_rating
    reviews.average('rating') || 'Unrated'
    # return 'Unrated' if reviews.none?

    # total = reviews.inject(0) { |sum, review|
    #   sum += review.rating
    # }

    # (total / reviews.length)
  end
  alias_method :rating, :average_rating

end
