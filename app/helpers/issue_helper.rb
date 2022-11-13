module IssueHelper
  def archive_base_url(issue)
    # useless local variable for readability:
    my_slug = issue.magazine.slug

    "cbm_magazine_index-#{my_slug}/#{my_slug}"
  end

  def archive_slug(issue)
    # useless local variables for readability:
    my_slug = issue.magazine.slug
    my_sequence = issue.special_slug || issue.sequence

    "#{issue.year}/#{my_slug}-#{'%02i' % my_sequence}-#{issue.year}#{'%02i' % issue.month}"
  end

  def article_page(page, issue)
    "page/#{page + issue.archive_page_offset}/mode/2-up"
  end

  def archive_download_link(issue)
    "https://archive.org/download/#{archive_base_url(issue)}/#{archive_slug(issue)}.pdf"
  end

  def archive_jpeg_link(issue)
    "https://archive.org/download/#{archive_base_url(issue)}/#{archive_slug(issue)}_jp2.zip"
  end

  def archive_ocr_link(issue)
    "https://archive.org/stream/#{archive_base_url(issue)}/#{archive_slug(issue)}_djvu.txt"
  end

  def archive_view_link(issue, page)
    "https://archive.org/details/#{archive_base_url(issue)}/#{archive_slug(issue)}/#{article_page(page, issue)}?view=theater"
  end

  def cover_image_url(issue)
    if issue.special_slug
      "covers/#{issue.magazine.slug}/#{issue.magazine.slug}-#{issue.special_slug}.jpg"
    else
      "covers/#{issue.magazine.slug}/#{issue.magazine.slug}-#{'%02i' % issue.sequence}.jpg"
    end
  end
end
