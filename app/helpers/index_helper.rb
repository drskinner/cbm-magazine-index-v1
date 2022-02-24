module IndexHelper
  def pagination_info(page:, page_count:, full_count:)
    return 'No records.' if full_count.zero?

    page ||= 1
    my_start = (page.to_i - 1) * User.page(1).limit_value + 1
    raw "Displaying #{my_start}&ndash;#{my_start + page_count - 1} of #{full_count} records."
  end

  def svg(icon)
    file_path = "#{Rails.root}/app/assets/images/#{icon}.svg"
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end
end
