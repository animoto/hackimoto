OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
provider :google_oauth2, '557188232850-coh8q3uptdujesoqhp0kld59k9mnq8sc.apps.googleusercontent.com', 'yA7yXywhVxJjIBISv4Cy4fSh', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
