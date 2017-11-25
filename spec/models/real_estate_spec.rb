require 'rails_helper'

RSpec.describe RealEstate, type: :model do
  it { is_expected.to  validate_presence_of(:street) }
  it { is_expected.to  validate_presence_of(:city) }
  it { is_expected.to  validate_presence_of(:state) }
  it { is_expected.to  validate_presence_of(:zip) }
  it { is_expected.to  validate_presence_of(:square_feet) }
  it { is_expected.to  validate_presence_of(:building_type) }
  it { is_expected.to  validate_presence_of(:sale_date) }
  it { is_expected.to  validate_presence_of(:price) }
  it { is_expected.to  validate_presence_of(:latitude) }
  it { is_expected.to  validate_presence_of(:longitude) }



  it { is_expected.to  validate_numericality_of(:square_feet) }
  it { is_expected.to  validate_numericality_of(:price) }
end
