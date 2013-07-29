require 'rubygems'
require 'rufus/scheduler'
 
scheduler = Rufus::Scheduler.new
 
scheduler.every '10m' do
  comments_count = Comment.count
  $redis.set(:comments_count, comments_count)
  users_count = User.count
  $redis.set(:users_count, users_count)
  blogs_count = Blog.count
  $redis.set(:blogs_count, blogs_count)
end

scheduler.every '1h' do
	Blog.all.each do |blog|
		blog.scored
	end
end
