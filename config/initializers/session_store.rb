app_name = Rails.application.class.module_parent_name.downcase

Rails.application.config.session_store :redis_session_store,
  key: "_#{app_name}_session",
  redis: {
    expire_after: 1.week,
    ttl: 1.week,
    key_prefix: "#{app_name}:session:",
    url: Rails.application.config.redis.session[:url]
  }
