class ChangeCreateAllowlistedJwtsToAllowlistedJwts < ActiveRecord::Migration[6.1]
  def change
    rename_table :create_allowlisted_jwts, :allowlisted_jwts
  end
end
