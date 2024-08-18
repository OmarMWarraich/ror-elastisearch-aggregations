require 'rails_helper'

RSpec.describe Television, type: :model do
  # Test for presence validations
  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:display) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:size) }
  it { should validate_presence_of(:year) }

  # Test for numericality
  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:year).only_integer }

  # Example of a custom method test
  describe '#full_description' do
    it 'returns the full description of the television' do
      television = build(:television, brand: 'Sony', name: 'X900H', display: 'LED', size: 55)
      expect(television.full_description).to eq('Sony X900H 55" LED')
    end
  end
end
