json.extract! req_competency, :id, :competencies, :created_at, :updated_at
json.url req_competency_url(req_competency, format: :json)
