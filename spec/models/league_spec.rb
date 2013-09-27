require 'spec_helper'

describe League do
  	before :each do
		@valid_name = "Barclays Premier League"
		@valid_country = "England"
		@league = League.create(name: @valid_name, country: @valid_country)
	end

	describe '#name' do
		it "should return league's name" do
			@league.name.should eq(@valid_name)
		end
	end

	describe '#country' do
		it "should return league's country" do
			@league.country.should eq(@valid_country)
		end
	end
end
