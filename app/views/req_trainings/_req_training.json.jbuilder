json.extract! req_training, :id, :train_type, :train_benefit, :sup_name, :sup_title, :created_at, :updated_at
json.url req_training_url(req_training, format: :json)
