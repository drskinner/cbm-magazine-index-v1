module IssueHelper
  def cover_image_url(issue)
    if issue.special_slug
      "covers/#{issue.magazine.slug}/#{issue.magazine.slug}-#{issue.special_slug}.jpg"
    else
      "covers/#{issue.magazine.slug}/#{issue.magazine.slug}-#{'%02i' % issue.sequence}.jpg"
    end
  end
end
