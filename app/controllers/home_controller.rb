#require "pg_tools"

class HomeController < ApplicationController
  #before_filter :check_schema

  def index
    if request.subdomain.split(".")[0] == 'www' or request.subdomain.blank?
      redirect_to  :controller => 'tenants', :action => 'index'
      return false
    end
    if check_schema
      @page = Page.all.first
      @content = @page.content
      redirect_to "/pages/#{@page.id}"
    else
      render :file => "#{Rails.root}/public/404.html", :status => :not_found
    end
  end

  private
  def check_schema
    @schema = PgTools.get_search_path

    if @schema.to_s.split(",")[0][1..5] == "$user"
      flash[:error] = "Page does not exist"
      not_found
      false
    else
      true
    end

  end

end
