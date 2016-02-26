require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:username) }

    it do
      should validate_uniqueness_of(:username).
      case_insensitive
    end
  end
end
