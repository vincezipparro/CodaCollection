module Jobs
  def visit_jobs_page
    visit 'https://codacollection.co/jobs'
  end

  def view_job(job_name)
    raise 'The job you are searching for has no job posting at this time' unless page.has_xpath? "//div[contains(text(),'#{job_name}')]"

    find(:xpath, "//div[contains(text(),'#{job_name}')]", match: :first).click
  end

  def assert_job_criteria
    expect(page).to have_xpath("//div[contains(text(),'Apply Now')]")
    job_posting_url = URI.parse(current_url)
    expect(job_posting_url.to_s).to include('qa-engineer')
  end
end
