json.extract! taskperformance, :id, :task_notdone, :task_reason, :task_impact, :created_at, :updated_at
json.url taskperformance_url(taskperformance, format: :json)
