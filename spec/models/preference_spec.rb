# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Preference, type: :model do
  describe 'validations' do
    it 'validate presence of requerid fields' do
      should validate_presence_of(:description)
      should validate_inclusion_of(:description).in_array(Constants::ADDITIONAL_DATA)
      should validate_uniqueness_of(:description).scoped_to(:user_id)
      should validate_length_of(:data)
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
