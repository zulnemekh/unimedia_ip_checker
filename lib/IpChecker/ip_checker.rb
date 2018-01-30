class IpChecker
  def initialize(project_name)
    @project_name = project_name
  end


  def letme_in(request)
     ip ||= request.remote_ip
    # :auth_type = 1 block
    # :auth_type = 0 allow
      
      any_ip = Base::DtbIpAddressBlock.where(:ip_address => 'all', :auth_type => 1, :project => @project_name).first    

      white_list_ip = any_ip && any_ip.auth_type.to_s == '1' ? true : false
    
      ip_address = Base::DtbIpAddressBlock.where(:ip_address => ip, :project => @project_name).first
      
      if white_list_ip
        # black list
          return false if ip_address            
        else
          # white list
          return false unless ip_address            
      end 
      return true
    
  end
end