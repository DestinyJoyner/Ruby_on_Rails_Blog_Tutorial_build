class BlogPost < ApplicationRecord
    # .validates is a method that validates the presence of the title and body attributes
    # validation happens at the model level (runs ANYWHERE a BlogPost is saved), runs automatically before saving to database available throught entire application
    #  write validations once works everywhere -> Convention over Configuration
    validates :title, presence: true
    validates :body, presence: true
end
