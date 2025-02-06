# when define a file, define a class with the same name as the file
# in this case, define a class BlogPostsController
# inherits from application controller -> base class for all controllers
# define an index action (method) inside the class
# this action will be called when the user navigates to the root path of the application
# the index action will render the index view (app/views/blog_posts/index.html.erb) -> html structure on this file

class BlogPostsController < ApplicationController
  # use before_action to run a method before any other actions are called
  # can do the opposite of this by using except: [:index, :new, :create]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  # define set_blog_post method to find the blog post by id that is used by all methods in array above to prevent code repetition

  # Authentication additions
  # authenticate user whenever they try to access the edit, update, or destroy actions
  before_action :authenticate_user!, except: [:index, :show]

    def index
      
      # instance variable -> @blog_posts
      # Instance variables (@) are automatically shared between the controller and its views
      # BlogPost is the model class that interfaces with the blog_posts table from models/blog_post.rb
      # Auto-Loading: Rails automatically loads all files from certain directories
      # autoloading system called Zeitwerk that: Automatically maps file names to class names -> No need for require, import, or export statements
      # app/ directory is automatically available throughout your application
      # .all is an Active Record method that translates to SELECT * 
      # can change command now to BlogPost.published
      @blog_posts = BlogPost.all
    end

    # create the show action
    def show
      # any parameters in the URL are automatically available in your controller through the params hash -> in React const { id } = useParams()
      # .find(<id>) -> returns the single record with the matching id
      # 
      # @blog_post = BlogPost.find(params[:id])
      # use rescue to catch if id doesn't exist and route back to root path
      # can move down to private method because it's used by multiple actions
      # rescue ActiveRecord::RecordNotFound
      #   redirect_to root_path
    end

    # create new blog post action
    def new
      # . new method creates a new instance of the BlogPost model used to create a new blog post ->  .new method is specifically for creating new Active Record objects that can interact with the database - it's part of Rails' ORM (Object-Relational Mapping) system
      #  # Like useState({ title: '', body: '' }) in React
      @blog_post = BlogPost.new
    end

    # define create action -> post request
    def create
      # .create method creates a new record in the database and saves all in one step
      # .new and then .save attempts to save to database allows for error handling and any extra steps in between 
      # the second .new is # Like setState with form data -> gets all form data at once on submit (not like React where updates on each keystroke)
      # @blog_post = BlogPost.new(params[:blog_post])
      # becasue of Rails Strong Params -> need to (whitelist) pre approve the params that are allowed to be passed to the create action -> anything not on the list is automatically denied access
      #  blog_post_params is a private method that returns the params that are allowed to be passed to the create action -> below
      @blog_post = BlogPost.new(blog_post_params)
      # conditions for error handling if post was saved successfully or not
      if @blog_post.save
        #  if it saves redirect to the show page
        redirect_to @blog_post
      else
        #  if it fails render new form again -> status: :unprocessable_entity is a Rails convention for a failed save
        render :new, status: :unprocessable_entity
      end
      # .save writes to database
    end

    # edit action method
    def edit
      # use find method to get the blog post to edit
      # can get rid if this line because of before_action
      # @blog_post = BlogPost.find(params[:id])
    end

    # update/ patch action method
    def update
      # find the blog post to update
      # can get rid if this line because of before_action
      # @blog_post = BlogPost.find(params[:id])
      # check if update method (updates and saves to database) can be performed on the blog post
      if @blog_post.update(blog_post_params)
        # if successful redirect to the show page
        redirect_to @blog_post
      else
        # if not successful render the edit page again
        render :edit, status: :unprocessable_entity
      end
    end

    # delete action method
    def destroy
      # find the blog post to delete
      # can get rid if this line because of before_action
      # @blog_post = BlogPost.find(params[:id])
      # delete the blog post -> .destroy method
      @blog_post.destroy
      # redirect to the index page -> b/c blog post doesn't exist anymore
      redirect_to root_path
    end

    private
    # Define which parameters allowed -> like validating form data and sending only  allowed fields to the database
    def blog_post_params
      params.require(:blog_post).permit(:title, :content)
    end

    # define set_blog_post method 
    def set_blog_post
      # can add published.find if want to trigger scheduled posts
      @blog_post = BlogPost.find(params[:id])
      # can move this to private method because it's used by multiple actions
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end

    # devise has method like by default authenticate_user! method
    # def authenticate_user!
    #     redirect_to new_user_session_path, alert: "You must be logged in to access this page" unless user_signed_in?
    #   end
    end

  
    