json.extract! s_skill, :id, :name, :desc, :difficulty, :created_at, :updated_at
json.url s_skill_url(s_skill, format: :json)