class HelloWorldJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "ジョブが実行されたよ！＼(^o^)／"
  end
end
