begin
  if Rails.env.production?
    data = File.read(Rails.root.join(".openproject-token.pub"))
    key = OpenSSL::PKey::RSA.new(data)
    OpenProject::Token.key = key
  else
    warn "INFO: Using a temporary key for development environment"
    OpenProject::Token.key = OpenSSL::PKey::RSA.generate(2048)  # Generiere einen temporären Schlüssel
  end
rescue StandardError => e
  warn "WARNING: Error while loading .openproject-token.pub key - #{e.message}"
end

