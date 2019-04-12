class RenameArticle < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :articles, :templates
  end

  def self.down
    rename_table :templates, :articles
  end
end
