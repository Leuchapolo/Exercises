class AddHoursToTimeEntries < ActiveRecord::Migration
  def change
    add_column :time_entries, :hours, :integer
    add_column :time_entries, :minutes, :integer
    add_column :time_entries, :comments, :text
    add_column :time_entries, :date, :datetime
  end
end
