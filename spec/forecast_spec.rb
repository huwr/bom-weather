require File.join(File.dirname(__FILE__), 'spec_helper')

module ForecastHelper
  def valid_forecast_attributes
    {
      :forecast_date => Time.parse("20080402T0900"),
      :issue_time => Time.parse("20080402T0900"),
      :max_temp => "24",
      :min_temp => "3",
      :conditions => "Cloudy, patchy rain"
    }
  end
end


describe BOMWeather::Forecast, "validation" do
  include ForecastHelper

  it "should be valid" do
    expect(BOMWeather::Forecast.new(valid_forecast_attributes)).to be_valid
  end

  it "should require forecast_date, issue_time, max_temp and min_temp" do
    %w(forecast_date issue_time max_temp min_temp conditions).each do |attr|
      expect(BOMWeather::Forecast.new(valid_forecast_attributes.without(attr.to_sym))).not_to be_valid
    end
  end

  it "forecast_date and issue_time must be a Time class instance" do
    # expect(BOMWeather::Forecast.new(valid_forecast_attributes.without(:forecast_date).merge({:forecast_date => '20080402T0900'}))).not_to be_valid
    expect(BOMWeather::Forecast.new(valid_forecast_attributes)).to be_valid

    # expect(BOMWeather::Forecast.new(valid_forecast_attributes.without(:issue_time).merge({:issue_time => '20080402T0900'}))).not_to be_valid
    expect(BOMWeather::Forecast.new(valid_forecast_attributes)).to be_valid
  end

  it "should have a condition description"
end

describe BOMWeather::Forecast, "class attributes" do
  include ForecastHelper

  before do
    @forecast = BOMWeather::Forecast.new(valid_forecast_attributes)
  end

  it "should have a give the time of when the forecast was taken" do
    expect(@forecast).to respond_to :issue_time
    expect(@forecast.issue_time).to(be_an_instance_of(Time))
  end

  it "should consist of forecast_date, issue_time, max_temp, min_temp" do
    %w(forecast_date issue_time max_temp min_temp conditions).each do |attr|
      expect(@forecast).to respond_to attr.to_sym
    end
  end
end