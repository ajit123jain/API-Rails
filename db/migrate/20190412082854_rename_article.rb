class RenameArticle < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :article, :template
  end

  def self.down
    rename_table :template, :article
  end
end
