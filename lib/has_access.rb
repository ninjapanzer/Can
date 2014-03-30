require_relative "user_cans.rb"

module Can
  module HasAccess

    def has_access?
      klass_name = self.class.to_s.downcase.gsub('controller','')
      cans_obj = UserCans.configure.cans_klass
      cans = cans_obj.const_get("Default")
      cans = UserCans.find_for current_user unless current_user.nil?
      allow = cans.can? klass_name.to_sym

      if !allow
        flash[:notice] = "You are not authorized to access #{klass_name.capitalize}"
        redirect_to root_path
      end
    end

  end
end
