require 'pg_tools'
class Tenant < ActiveRecord::Base

  validates :subdomain, :uniqueness => true
  after_create :prepare_tenant

  private
  def prepare_tenant
    create_schema
    load_tables
  end

  # This function will create create schema for new subdmain.
  def create_schema
    PgTools.create_schema id unless PgTools.schemas.include? id
  end
  # This function will use schema.rb and will load scchema tables into the database.
  def load_tables
    return if Rails.env.test?
    PgTools.set_search_path id, false
    load "#{Rails.root}/db/schema.rb"
    PgTools.restore_default_search_path
  end
end
