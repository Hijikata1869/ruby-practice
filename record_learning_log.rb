require 'date'
require "tty-prompt"

prompt = TTY::Prompt.new

print '今日の学習内容：'

input = gets.chomp

today = Date.today

old_file = File.read('./log.md')

new_file = "# #{today.year}/#{today.month}/#{today.day}\n#{input}\n" + "\n#{old_file}"

File.open('./log.md', 'w') do |f|
  f.puts new_file
end

`git add -A`

commit_content = `git diff HEAD log.md`

confirmation_message = <<~TEXT
  以下の内容でcommitします。よろしいですか？
  ----------------------------------------
  #{commit_content}
  ----------------------------------------
TEXT

is_commit = prompt.yes?("#{confirmation_message}")

if is_commit
  `git commit -m "updated learning_log.md`
  puts 'commitしました'
else
  puts 'commitできませんでした'
end

is_push = prompt.yes?("続けてpushしますか？")

if is_push
  `git push origin main`
  puts 'pushしました'
else
  puts 'pushできませんでした'
end



