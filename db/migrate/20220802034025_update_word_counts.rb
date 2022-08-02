class UpdateWordCounts < ActiveRecord::Migration[6.0]
  def change
    PersonalLog::Entry.all.each do |entry|
      entry.update_column(:word_count, entry.content.split(' ').size)
    end
  end
end
