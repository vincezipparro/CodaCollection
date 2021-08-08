module MailingList
  def generate_and_submit_email(email_name)
    find(:xpath, '//form[1]/div[1]/div[1]/input[1]').set("#{email_name}@gmail.com")

    click_button 'Subscribe'
  end
end
