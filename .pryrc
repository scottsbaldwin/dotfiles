["~/.irbrc", "~/.pryrc.local"].each do |file|
  path = File.expand_path file
  load path if File.exists?(path)
end

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'f', 'finish'
