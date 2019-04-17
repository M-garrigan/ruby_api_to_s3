# spec/helpers/roundTimeDown.rb

require "date"
require_relative "../../bin/helpers/roundTimeDown.rb"

RSpec.describe '.roundTimeDown(time)' do
  time_0_min  = DateTime.new(2020, 4, 20, 7, 0, 30)
  time_11_min = DateTime.new(2020, 4, 20, 7, 11, 30)
  time_19_min = DateTime.new(2020, 4, 20, 7, 19, 30)
  time_50_min = DateTime.new(2020, 4, 20, 7, 50, 30)

  it 'should handle time with minute @ 0' do
    time = roundTimeDown(time_0_min)
    expect(time).to eq([2020, 4, 20, 7, 0])
  end

  it 'should handle time with minute @ 11' do
    time = roundTimeDown(time_11_min)
    expect(time).to eq([2020, 4, 20, 7, 10])
  end

  it 'should handle time with minute @ 19' do
    time = roundTimeDown(time_19_min)
    expect(time).to eq([2020, 4, 20, 7, 15])
  end

  it 'should handle time with minute @ 50' do
    time = roundTimeDown(time_50_min)
    expect(time).to eq([2020, 4, 20, 7, 50])
  end

  it 'should return an array' do
    value = roundTimeDown(time_0_min)
    expect(value.class).to eq(Array)
  end

  it 'should return an array of 5 items' do
    value = roundTimeDown(time_0_min)
    expect(value.size).to eq(5)
  end

  it 'should return an array of 5 integers' do
    value = roundTimeDown(time_0_min)
    expect(value).to all(be_an(Integer))
  end
end