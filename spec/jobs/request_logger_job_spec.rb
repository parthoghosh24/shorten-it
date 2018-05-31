require 'rails_helper'

describe RequestLoggerJob, type: :job do
  include ActiveJob::TestHelper

  before(:all) do
  	@url = Url.build("https://github.com","http://shorten.it")
  	@short_url_text = @url.short_url_text
  end

  subject(:job) {RequestLoggerJob.perform_later(@short_url_text,"https://google.com","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36","20.197.105.223")}

  it 'queues the job' do
  	expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

   it 'is in default queue' do
    expect(RequestLoggerJob.new.queue_name).to eq('default')
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end

end
