OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
provider :google_oauth2, '537081674432-k8bj3fui61ol949k7vd966soacc0p8n2.apps.googleusercontent.com', '0XKZW4G3cqo8tV4K4ZZW1fgf', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end