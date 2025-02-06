class CleanupBlogPostColumns < ActiveRecord::Migration[8.0]
  def change
     # Remove published_at if you don't need it
     remove_column :blog_posts, :published_at
  end
end
