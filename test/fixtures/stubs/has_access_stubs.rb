module Can
  module UserCans
    
    def self.configure
      ConfigurationStub.new
    end

    def self.find_for fake
      fake
    end
    
    class ConfigurationStub
      
      def cans_klass
        UserCans
      end

      class Default; end
    end
  end
end

class AccessibleControllerStub
  include Can::HasAccess
  def current_user
    self
  end

  def can? fake
    true
  end
end

class InaccessibleControllerStub
  include Can::HasAccess
  def current_user
    self
  end

  def can? fake
    false
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
