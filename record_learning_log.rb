require 'date'

print '今日の学習内容：'

input = gets.chomp

today = Date.today

old_file = File.read('./log.md')

new_file = "# #{today.year}/#{today.month}/#{today.day}\n#{input}\n" + "\n#{old_file}"

File.open('./log.md', 'w') do |f|
  f.puts new_file
end


