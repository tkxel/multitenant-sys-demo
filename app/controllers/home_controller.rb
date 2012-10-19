#require "pg_tools"

class HomeController < ApplicationController
  #before_filter :check_schema

  def index
    if request.subdomain.split(".")[0] == 'www'
      redirect_to  :controller => 'tenants', :action => 'index'
      return false
    end
    check_schema
    @page = Page.all.first
    @content = @page.content
    redirect_to "/pages/#{@page.id}"
    #unless @content
    #  reset_subdomain
    #  #redirect_to  :controller => 'pages', :action => 'new'
    #  #return true
    #end
  end

  private
  def check_schema
    @schema = PgTools.get_search_path

    if @schema.to_s.split(",")[0][1..5] == "$user"
      flash[:error] = "Page does not exist"
      not_found
      false
    end

  end

end