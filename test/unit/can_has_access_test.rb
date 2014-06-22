require_relative "../../lib/has_access.rb"
require 'user_cans'
require_relative "../fixtures/stubs/has_access_stubs.rb"

class CanHasAccessTest

  class UserCans < Can::UserCans

    class InaccessibleControllerStub
      include Can
      
    end

    class AccessibleControllerStub
    end

    class Default; end
  end

  describe "HasAccess" do

    before :each do
      CanHasAccessTest::UserCans.configure do |config|
        config.cans_klass = :"CanHasAccessTest::UserCans"
      end
    end

    it "should respond to has_access?" do
      String.any_instance.stubs(:classify).returns(:AccessibleControllerStub)
      expect(AccessibleControllerStub.new).to respond_to :has_access?
    end

    it "should not redirect on has_access?" do
      String.any_instance.stubs(:classify).returns(:AccessibleControllerStub)
      expect(AccessibleControllerStub.new.has_access?).to eq(nil)
    end

    it "should redirect when user can't access controller" do
      String.any_instance.stubs(:classify).returns(:InaccessibleControllerStub)

      expect(InaccessibleControllerStub.new.has_access?).to eq('path')
    end
  end

end
