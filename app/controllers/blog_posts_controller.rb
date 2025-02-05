# when define a file, define a class with the same name as the file
# in this case, define a class BlogPostsController
# inherits from application controller -> base class for all controllers
# define an index action (method) inside the class
# this action will be called when the user navigates to the root path of the application
# the index action will render the index view (app/views/blog_posts/index.html.erb) -> html structure on this file

class BlogPostsController < ApplicationController
    def index
      # instance variable -> @blog_posts
      # Instance variables (@) are automatically shared between the controller and its views
      # BlogPost is the model class that interfaces with the blog_posts table from models/blog_post.rb
      # Auto-Loading: Rails automatically loads all files from certain directories
      # autoloading system called Zeitwerk that: Automatically maps file names to class names -> No need for require, import, or export statements
      # app/ directory is automatically available throughout your application
      # .all is an Active Record method that translates to SELECT * 
      @blog_posts = BlogPost.all
    end

    # create the show action
    def show
      # any parameters in the URL are automatically available in your controller through the params hash -> in React const { id } = useParams()
      # .find(<id>) -> returns the single record with the matching id
      @blog_post = BlogPost.find(params[:id])
      # use rescue to catch if id doesn't exist and route back to root path
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
    end