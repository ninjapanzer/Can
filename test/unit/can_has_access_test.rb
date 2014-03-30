require_relative "../../lib/has_access.rb"
require_relative "../../lib/user_cans.rb"

class HasAccessStub
  include Can::HasAccess
end

describe "HasAccess" do
  it "should respond to has_access?" do
    binding.pry
    expect(HasAccessStub.new).to respond_to :has_access?
  end
end
