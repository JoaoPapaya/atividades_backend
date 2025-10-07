Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'  # Permite qualquer origem. Troque por 'http://localhost:8081' para restringir.

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false
  end
end
