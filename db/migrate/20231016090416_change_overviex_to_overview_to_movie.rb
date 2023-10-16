class ChangeOverviexToOverviewToMovie < ActiveRecord::Migration[7.0]
  def change
    rename_column :movies, :overviex, :overview
  end
end
