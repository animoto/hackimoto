class AddRuleToHackimotos < ActiveRecord::Migration
  def change
    add_column :hackimotos, :rule, :text
  end
end
