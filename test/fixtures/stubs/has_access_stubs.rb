module AuthStubs
  def current_user
    self
  end

  def role
    self.class.to_s
  end

  def flash
    {}
  end

  def root_path
    "path"
  end

  def redirect_to thing
    thing
  end
end

class AccessibleControllerStub
  include Can::HasAccess
  include AuthStubs
  
  def route; end
end

class InaccessibleControllerStub
  include Can::HasAccess
  include AuthStubs
end
