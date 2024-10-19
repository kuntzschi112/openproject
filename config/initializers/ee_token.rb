begin
  OpenProject::Enterprise.token = File.read(Rails.root.join('.openproject-token.pub'))
rescue Errno::ENOENT
  # File not found, using empty token
  OpenProject::Enterprise.token = ''
end
