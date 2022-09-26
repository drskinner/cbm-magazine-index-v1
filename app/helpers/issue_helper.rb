module IssueHelper
  def archive_slug(issue)
    # useless local variables for readability:
    my_slug = issue.magazine.slug
    my_sequence = issue.special_slug || issue.sequence

    "#{my_slug}/#{issue.year}/#{my_slug}-#{my_sequence}-#{issue.year}#{'%02i' % issue.month}"
  end

  def archive_download_link(issue)
    "https://archive.org/download/cbm-magazine-index/#{archive_slug(issue)}.pdf"
  end

  def archive_jpeg_link(issue)
    "https://archive.org/download/cbm-magazine-index/#{archive_slug(issue)}_jp2.zip"
  end

  def archive_ocr_link(issue)
    "https://archive.org/stream/cbm-magazine-index/#{archive_slug(issue)}_djvu.txt"
  end

  def archive_view_link(issue)
    "https://archive.org/details/cbm-magazine-index/#{archive_slug(issue)}/"
  end

  def cover_image_url(issue)
    if issue.special_slug
      "covers/#{issue.magazine.slug}/#{issue.magazine.slug}-#{issue.special_slug}.jpg"
    else
      "covers/#{issue.magazine.slug}/#{issue.magazine.slug}-#{'%02i' % issue.sequence}.jpg"
    end
  end
end
