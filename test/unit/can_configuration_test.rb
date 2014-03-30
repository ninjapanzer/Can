require_relative '../../lib/user_cans.rb'

describe "Configuration" do
  it "should return a default config" do
    expect(Can::UserCans.configuration).not_to eq(nil)
  end
end
