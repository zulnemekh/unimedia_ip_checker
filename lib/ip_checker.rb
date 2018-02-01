class IpChecker
  def initialize(project_name)
    @project_name = project_name
  end

  def is_block_ip(request)
      ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_ip
      # :auth_type = 1 block
      # :auth_type = 0 allow
      connection = ActiveRecord::Base.connection()
      any_ip = connection.execute("SELECT *              
          FROM
              dtb_ip_address_block
          WHERE
              dtb_ip_address_block.ip_address = 'all'
                  AND dtb_ip_address_block.auth_type = 1
                  AND dtb_ip_address_block.project = '#{@project_name}';")
      
      white_list_ip = any_ip.first && any_ip.first[2].to_s == '1' ? true : false
        
      ip_address = connection.execute(" SELECT *
          FROM
              dtb_ip_address_block
          WHERE
              dtb_ip_address_block.ip_address = '#{ip}'
                  AND dtb_ip_address_block.project = '#{@project_name}'")
    
      if white_list_ip 
          return true if ip_address.first
        else
          return true unless ip_address.first
      end 
      return false
    
  end
  
end