require 'bundler'
Bundler.require

task :test do
  Dir.glob('./test/**/mastermind_test.rb') { |file| require file }
end

task :run do
  Dir.glob('./lib/**/*runner.rb') { |file| ruby file }
end
