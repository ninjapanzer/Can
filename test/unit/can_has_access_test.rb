require_relative "../../lib/has_access.rb"
require_relative "../fixtures/stubs/has_access_stubs.rb"

class CanHasAccessTest

  describe "HasAccess" do
    it "should respond to has_access?" do
      expect(AccessibleControllerStub.new).to respond_to :has_access?
    end

    it "should not redirect on has_access?" do
      expect(AccessibleControllerStub.new.has_access?).to eq(nil)
    end

    it "should redirect when user can't access controller" do
      expect(InaccessibleControllerStub.new.has_access?).to eq("path")
    end
  end

end
