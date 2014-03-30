require_relative '../../lib/user_cans.rb'

describe "Configuration" do
  it "should return a config object if block not given" do
    expect(Can::UserCans.configure).not_to eq(nil)
  end

  it "should accept a block" do
    expect { |b| Can::UserCans.configure(&b) }.to yield_control
  end

  it "should return a default object" do
    config = Can::UserCans.configure
    expect(config.cans_klass).to eq(Can::UserCans)
    expect(config.unauthorized_path).to eq('/')
  end

  it "should return the configured unauth path" do
  end

  it "should return the configured cans class const" do
  end

end

