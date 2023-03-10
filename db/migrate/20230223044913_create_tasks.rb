class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end

#Title, Description
# press command + [ or ] to do indentation
# press command - [ or ] to do indentation
#to save command + s
# command + p