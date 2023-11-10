json.extract! request_training, :id, :train_type, :train_benefit, :created_at, :updated_at
json.url request_training_url(request_training, format: :json)
