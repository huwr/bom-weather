require File.join(File.dirname(__FILE__), 'spec_helper')

describe BOMWeather::Location do
  it "should respond to location_id" do
    expect(BOMWeather::Location.public_instance_methods).to include(:location_id)
  end

  it "should respond to name" do
    expect(BOMWeather::Location.public_instance_methods).to include(:name)
  end

  it "should respond to state" do
    expect(BOMWeather::Location.public_instance_methods).to include(:state)
  end

  it "should respond to find" do
    expect(BOMWeather::Location.find(:location => :Melbourne)).to be_an_instance_of(Array)
    expect(BOMWeather::Location.find(:location => :Melbourne).first).to be_an_instance_of(BOMWeather::Location)
  end

  it "should find case-insensitive matches" do
    expect(BOMWeather::Location.find(:state => :BrisBane)).to be_an_instance_of(Array)
  end

  it "should have a current forecast" do
    expect(BOMWeather::Location.find(:location => :Melbourne).first.today).to be_an_instance_of(BOMWeather::Forecast)
  end

  it "should have a forecast outlook" do
    expect(BOMWeather::Location.find(:location => :Melbourne).first.outlook).to be_an_instance_of(Array)
    expect(BOMWeather::Location.find(:location => :Melbourne).first.outlook.first).to be_an_instance_of(BOMWeather::Forecast)
  end
end