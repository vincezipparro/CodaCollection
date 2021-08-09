module Jobs
  def visit_jobs_page
    visit 'https://codacollection.co/jobs'
  end

  def view_job(job_name)
    if page.has_xpath? "//div[contains(text(),'#{job_name}')]"
      find(:xpath, "//div[contains(text(),'#{job_name}')]", match: :first).click
    else
      raise 'There is no job posting for the specified parameters'
    end
  end

  def verify_job_criteria
    expect(page).to have_xpath("//div[contains(text(),'Apply Now')]")
    job_posting_url = URI.parse(current_url)
    expect(job_posting_url.to_s).to include('qa-engineer')
  end
end