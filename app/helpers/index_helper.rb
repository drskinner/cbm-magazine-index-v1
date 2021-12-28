module IndexHelper
  def svg(icon)
    file_path = "#{Rails.root}/app/assets/images/#{icon}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end
end
