namespace :job do
  desc "HelloWorldJobを実行する"
  task helloworld: :environment do
    HelloWorldJob.perform_now
  end

end
