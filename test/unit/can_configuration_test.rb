require 'user_cans'
require 'default_user_cans'

module UserRoles; class Wunderbar; end; end

class CanConfigurationTest

  describe "Configuration" do

    it "should return a config object if block not given" do
      expect(Can::UserCans.configure).not_to eq(nil)
    end

    it "should accept a block" do
      expect { |b| Can::UserCans.configure(&b) }.to yield_control
    end

    it "should return a default object" do
      binding.pry
      config = Can::UserCans.configure
      expect(config.cans_klass).to eq(Can::DefaultUserCans)
      expect(config.unauthorized_path).to eq('/')
    end

    it "should return the configured unauth path" do
      Can::UserCans.configure do |config|
        config.unauthorized_path = "things"
      end
      expect(Can::UserCans.configure.unauthorized_path).to eq("things")
    end

    it "should return the configured cans class const" do
      Can::UserCans.configure do |config|
        config.cans_klass = :"UserRoles::Wunderbar"
      end
      expect(Can::UserCans.configure.cans_klass).to eq(UserRoles::Wunderbar)
    end

  end
end
