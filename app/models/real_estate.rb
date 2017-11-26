class RealEstate < ApplicationRecord
    enum building_type: ['Residential', 'Condo', 'Multi-Family', "Unkown"]


    # validations

    validates :street, :city, :zip, :state, :beds_number , :square_feet , :building_type, :sale_date, :price , :latitude, :longitude, presence: true

    validates :square_feet, :price, numericality: true

    validates :building_type, inclusion: { in: RealEstate.building_types.keys }
    # scopes

    # search for real estate price
    scope :price_from, ->(price_from) {
        price_from.present? ? where("price >= ? ", price_from) : where(nil)
    }

    scope :price_to, ->(price_to) {
        price_to.present? ? where("price <= ? ", price_to) : where(nil)
    }

    # search for real estate square feet area
    scope :area_from, ->(area_from) {
        area_from.present? ? where("square_feet >= ? ", area_from) : where(nil)
    }

    scope :area_to, ->(area_to) {
        area_to.present? ? where("square_feet <= ? ", area_to) : where(nil)
    }

    # search for real estate type
    scope :real_estate_building_type, ->(building_type) {
        # force the building_type to be one of predifend values
        building_type.present? ? where(building_type: RealEstate.building_types[building_type.to_sym]) : where(nil)
    }
end
