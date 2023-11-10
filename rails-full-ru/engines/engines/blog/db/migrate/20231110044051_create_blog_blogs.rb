class CreateBlogBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blog_blogs do |t|
      t.text :body
      t.string :title

      t.timestamps
    end
  end
end
