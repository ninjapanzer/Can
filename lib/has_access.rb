module Can
  module HasAccess

    def has_access?
      klass_name = self.class.to_s.downcase.gsub('controller','')
      cans_obj = Object.const_get(UserCans.configuration.cans_klass.to_s.camelize)
      cans = cans_obj.const_get("Default")
      cans = UserCans.find_for current_user unless current_user.nil?
      allow = cans.can? class_name.to_sym

      if !allow
        flash[:notice] = "You are not authorized to access #{class_name.capitalize}"
        redirect_to root_path
      end
    end

  end
end
