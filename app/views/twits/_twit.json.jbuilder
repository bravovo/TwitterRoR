json.extract! twit, :id, :caption, :longitude, :latitude, :user_id, :allow_comments, :show_likes_count, :created_at, :updated_at
json.url twit_url(twit, format: :json)
