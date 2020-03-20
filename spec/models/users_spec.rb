require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "validate presence of requerid fields" do
      should validate_presence_of(:name)
      should validate_presence_of(:last_name)
      should validate_presence_of(:phone_number)
      should validate_presence_of(:address)
      should validate_presence_of(:email)
      should validate_uniqueness_of(:email)
      should allow_value('test@email.com').for(:email)
      should_not allow_value('not_an_email').for(:email)
    end
  end
end