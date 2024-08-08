class ApplicationController < ActionController::Base
  before_action :check_pending_migrations

  private

  def check_pending_migrations
    migration_context = ActiveRecord::MigrationContext.new(ActiveRecord::Tasks::DatabaseTasks.migrations_paths, ActiveRecord::SchemaMigration)
    pending_migrations = migration_context.open.pending_migrations

    if pending_migrations.any?
      raise ActiveRecord::PendingMigrationError.new(pending_migrations: pending_migrations)
    end
  end
end