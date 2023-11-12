Rails.application.routes.draw do
  resources :other_competences
  resources :other_taskperformances
  resources :other_positions
  resources :other_perfromeds
  resources :nested_descriptions
  resources :request_trainings
  get 'sup_admin/index'
  resources :oth_positions
  get 'final_step/index'
  resources :notrel_trainings
  resources :rel_trainings
  resources :nested_trainings
  resources :other_competencies
  resources :other_tasks
  resources :req_trainings
  resources :nested_othperformes
  resources :nested_othperformeds
  resources :nested_taskperformances
  resources :taskperformances
  resources :competencies
  resources :oth_tasks
  resources :oth_competencies

  resources :req_competencies
  resources :task_perfomances
  get 'home/index'
  get 'admin_index', to: 'admin#index'
  get 'admin_dashboard', to: 'admin#dashboard'
  get 'admin_archieve', to: 'admin#archieve'


  get '/emp_details/new', to: 'emp_details#new', as: 'emp_details_new'

  get '/emp_details/:id/edit', to: 'emp_details#edit', as: 'emp_details_edit'
  get '/jb_decriptions/new', to: 'jb_decriptions#new', as: 'jb_decriptions_new'


  get 'benefits/new', to: 'benefits#new', as: 'benefits_new'
  get 'benefits/index', to: 'benefits#index', as: 'benefits_index'
  resources :jb_performeds
  resources :jb_descriptions
  resources :benefits
  resources :emp_details
  devise_for :users

  resources :final_step do
    member do
      get 'update_submission'

    end
  end


 # Define the custom actions for AdminController outside the resources block
get 'admin/destroy_data/:id', to: 'admin#destroy_data', as: 'admin_destroy_data'
get 'admin/generate_pdf/:id', to: 'admin#generate_pdf', as: 'pdfadmin'
get 'admin/download_excel', to: 'admin#download_excel', as: 'download_excel'
get 'search_users', to: 'admin#search'
get 'destroy_data' => 'final_step#destroy_data', as: :destroy_data_home



# Then, define the resources for admin/user_management as you have it
namespace :admin do
  resources :user_management, only: [:new, :create, :edit, :update, :index] do
    member do
      get :approve_user
      get :archieve_user
      get :restore_user
      get :show_user
    end
  end
end



  resources :home do
    member do
      get 'destroy_data', to: 'home#destroy_data'
      get 'generate_pdf', to: 'home#generate_pdf', as: 'pdf'
    end
  end

  resources :oth_performeds do
    member do
      get 'custom_destroy'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "devise/sessions#new"
    get '/news_session', to: 'users/sessions#news', as: 'news_session'
  end
end
