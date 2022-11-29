json.extract! issue, :id, :title, :detail, :image, :cause, :goal, :gap, :due_date_at, :priority, :status, :done_flag, :created_at, :updated_at
json.url issue_url(issue, format: :json)
