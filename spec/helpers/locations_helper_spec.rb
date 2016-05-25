require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the LocationsHelper. For example:
#
# describe LocationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe LocationsHelper, type: :helper do
  describe "#city_state_zip" do 
    it "returns an empty string if the location is missing city, state or ZIPCODE" do 
      location1 = Location.create(nickname: "home") 
      location2 = Location.create(nickname: "somewhere", city: "Los Angeles", state: "CA")
      expect(helper.city_state_zip(location1)).to be_nil
      expect(helper.city_state_zip(location2)).to be_nil
    end
    
    it "returns the full city, state and ZIP if the location has them" do 
      location = Location.create(nickname: "home", city: "Los Angeles", state: "CA", zipcode: "99999")
      expect(helper.city_state_zip(location)).to eq("<p>Los Angeles, CA 99999</p>")
    end
  end
end
