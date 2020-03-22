class Preference < ApplicationRecord

  belongs_to :user

  validates_size_of :data, minimum: 1, message: 'Data must be sent with at least one datum'
  validates :user_id, :description, presence: true
  validates :description,
            inclusion: {
                in: Constants::ADDITIONAL_DATA,
                message: "Must have one of the following values #{Constants::ADDITIONAL_DATA.join(',')}"
            }
  validates :description, uniqueness: {
      scope: :user_id
  }

end
