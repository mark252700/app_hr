json.extract! other_task, :id, :task_notdone, :task_reason, :task_impact, :created_at, :updated_at
json.url other_task_url(other_task, format: :json)
