require_relative "can.rb"

module Can
  module UserCans

    class << self
      attr_accessor :configuration
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
      self.configuration
    end

    class Configuration

      attr_accessor :unauthorized_path
      attr_writer :cans_klass

      def cans_klass
        Object.const_get(@cans_klass.to_s)
      end

      def initialize
        @cans_klass = "Can::UserCans"
        @unauthorized_path = '/'
      end

    end

    class Default
      include Can
    end

    def find_for user
      role_class = user.role.gsub(' ', '_').classify
      return UserCans.const_get(role_class) if UserCans.const_defined? role_class
    end
  end
end
=begin
class UserCans
  def self.find_for user
    role_class = user.role.gsub(' ', '_').classify
    return UserCans.const_get(role_class) if UserCans.const_defined? role_class
  end

  class Default
    include Can
  end

  class Admin
    include Can

    can :control
    can :"control::events"
    can :"control::proposals"
    can :review
  end

  class Reviewer
    include Can

    can :review
  end
end
=end
