Rails.application.routes.draw do
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
  resources :oth_performeds
  resources :req_competencies
  resources :task_perfomances
  get 'home/index'
  get 'admin_index', to: 'admin#index'

  
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


  namespace :admin do
    resources :user_management, only: [:new, :create, :edit, :update, :index] do
      member do
        get :approve_user
        get :show_user
      end
    end
  
    resources :admin, only: [:index] do
      member do
        delete :destroy
      end
    end
  end

  

  resources :home do
    member do
      get 'destroy_data', to: 'home#destroy_data'
    end
  end

 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
