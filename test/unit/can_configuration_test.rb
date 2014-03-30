require_relative '../../lib/user_cans.rb'

describe "Configuration" do
  it "should return a default config" do
    expect(Can::UserCans.configuration).not_to eq(nil)
  end

  it "should accept a block" do
    expect({ |b| Can::UserCans.configure(&b) }.to yield_control
  end
end
