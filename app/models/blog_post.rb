class BlogPost < ApplicationRecord
  # for Action Text
  has_rich_text :content
  # can move body column info to the content column and get rid of body column

    # .validates is a method that validates the presence of the title and body attributes
    # validation happens at the model level (runs ANYWHERE a BlogPost is saved), runs automatically before saving to database available throught entire application
    #  write validations once works everywhere -> Convention over Configuration
    validates :title, presence: true
    # validates :body, presence: true

    # create a scope for published posts -> pre-defined database queries:
            # BlogPost.draft           # Get all drafts
            # BlogPost.published       # Get all published
            # BlogPost.scheduled      # Get all scheduled
    # scope :draft, -> { where(published_at: nil) }
    # scope :published, -> { where("published_at <= ?", Time.current) }
    # scope :scheduled, -> { where("published_at > ?", Time.current) }
end
# add published_at field to blog_post model:
  # run rails generate migration AddPublishedAtToBlogPosts published_at:datetime
  # run rails db:migrate

  # `status` string field
# - draft
# - published
# -scheduled

# `published_at` datetime field
# -nil
# -1.year.ago
# -1.year.from_now




