class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :handle_subdomain
  after_filter :reset_subdomain

  def handle_subdomain
    if @tenant = Tenant.find_by_subdomain(request.subdomain.split(".")[0])
      PgTools.set_search_path @tenant.id
    else
      PgTools.restore_default_search_path
    end
  end


  def reset_subdomain
    PgTools.restore_default_search_path
  end

  def not_found
    #raise ActionController::RoutingError.new('No Website with this DOMAIN exist')
  end

end
