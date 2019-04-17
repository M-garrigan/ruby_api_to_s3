# spec/helpers/test1_spec.rb

require_relative "../../bin/helpers/config.rb"

RSpec.describe '.config()' do
  db = config()
  
  it 'should return a hash' do 
    expect(db.instance_of?(Hash)).to eq(true)
  end

  it 'should return a hash that has 5 elements' do 
    expect(db.size).to eq(5)
  end

  it 'should return a hash that contains a host key' do 
    expect(db.key?(:host)).to eq(true)
  end

  it 'should return a hash that contains a port key' do 
    expect(db.key?(:port)).to eq(true)
  end

  it 'should return a hash that contains a user key' do 
    expect(db.key?(:user)).to eq(true)
  end

  it 'should return a hash that contains a password key' do 
    expect(db.key?(:password)).to eq(true)
  end

  it 'should return a hash that contains a dbname key' do 
    expect(db.key?(:dbname)).to eq(true)
  end
end