RailsAdmin.config do |config|
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  config.authenticate_with do
    authenticate_or_request_with_http_basic(%q{What's the password?}) do |username, password|
      username == ENV.fetch('RAILS_ADMIN_USER') && password == ENV.fetch('RAILS_ADMIN_PASSWORD')
    end
  end
end
