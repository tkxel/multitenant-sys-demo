module PgTools
  extend self
  # Default search path is defined here, which is public.
  def default_search_path
    @default_search_path ||= %{"$user", public}
  end
  # Set default path can be set using this function.
  def set_search_path(name, include_public = true)
    path_parts = [name.to_s, ("public" if include_public)].compact
    ActiveRecord::Base.connection.schema_search_path = path_parts.join(",")
  end
  # This function will restore default search path, which is defined above in "default_search_path" function.
  def restore_default_search_path
    ActiveRecord::Base.connection.schema_search_path = default_search_path
  end
  # Create DB schema using the tenant name.
  def create_schema(name)
    sql = %{CREATE SCHEMA "#{name}"}
    ActiveRecord::Base.connection.execute sql
  end
  # Scchema is defined here.
  def schemas
    sql = "SELECT nspname FROM pg_namespace WHERE nspname !~ '^pg_.*'"
    ActiveRecord::Base.connection.query(sql).flatten
  end
  # Search path can be get using this function.
  def get_search_path
    @path = ActiveRecord::Base.connection.schema_search_path
    @path
  end

end
