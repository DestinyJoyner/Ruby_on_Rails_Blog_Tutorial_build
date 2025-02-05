Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # ROUTE DEFINITIONS
  # can define request types for routes
  # route order matters prevent endpoints from being read as parameter
   # create a new blog post action
   get "blog_posts/new" => "blog_posts#new", as: :new_blog_post
  # get, post, put, patch, delete
  #  => syntax same as to:
  # can give rout a variable name to be referenced easily in app (as: :blog_post)
  get "blog_posts/:id" => "blog_posts#show", as: :blog_post
  # <Route path="/blog_posts/:id" element={<BlogPosts.Show />} />
  # blog_post_path(<id>) -> returns the path for the show action of the blog post with the given id
  # blog_post_url(<id>) -> returns the full URL for the show action of the blog post with the given id

  # edit route so post/:id/edit -> edit action
  get "blog_posts/:id/edit" => "blog_posts#edit", as: :edit_blog_post

  # patch route for update action
  #  no need for variable (path helper) because already defined in show route that has same endpoint
  # then need to add update action in controller -> #update
  patch "blog_posts/:id" => "blog_posts#update"

  # delete route for destroy action -> no variable again b/c already defined in show route that has same endpoint
  # then need to add destroy action in controller -> #destroy
  delete "blog_posts/:id" => "blog_posts#destroy"

  # looking for blog_posts_path because it needs to know where to submit the form -> need route for POST action (handle submit request) -> variable is PLURAL
  post "blog_posts" => "blog_posts#create", as: :blog_posts
 


  # get "blog_posts" => "blog_posts#index"
  # get "blog_posts/:id" => "blog_posts#show"
  # post "blog_posts" => "blog_posts#create"
  # put "blog_posts/:id" => "blog_posts#update"
  # delete "blog_posts/:id" => "blog_posts#destroy"


  # Defines the root path route ("/")
  # Root route can be anywhere in the file, but conventionally at the bottom
  # blog_posts tells Rails to look for BlogPostsController due to syntax formatting of BlogPosts -> blog_posts
  # blog_posts → looks for app/controllers/blog_posts_controller.rb
  # #index tells Rails to call the index method in that controller -> hence creation of class and creation of index method (action)
  # controller class must be BlogPostsController (Rails automatically converts snake_case to CamelCase
  # The index method in the controller automatically looks for a view in app/views/blog_posts/index.html.erb
  # The index.html.erb file is automatically rendered when the index action is called
  root "blog_posts#index"
end
