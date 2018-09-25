require './config/environment'

if ActiveRecord::Migration.needs_migration?
  raise 'Migrations are pending. `Run db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run AppliactionController
