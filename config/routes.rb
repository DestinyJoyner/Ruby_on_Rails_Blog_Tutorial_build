Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # blog_posts tells Rails to look for BlogPostsController due to syntax formatting of BlogPosts -> blog_posts
  # blog_posts → looks for app/controllers/blog_posts_controller.rb
  # #index tells Rails to call the index method in that controller -> hence creation of class and creation of index method (action)
  # controller class must be BlogPostsController (Rails automatically converts snake_case to CamelCase
  # The index method in the controller automatically looks for a view in app/views/blog_posts/index.html.erb
  # The index.html.erb file is automatically rendered when the index action is called
  root "blog_posts#index"
end
