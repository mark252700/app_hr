json.extract! nested_taskperformance, :id, :task_notdone, :task_reason, :task_impact, :created_at, :updated_at
json.url nested_taskperformance_url(nested_taskperformance, format: :json)
