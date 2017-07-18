open('Blog_Tags.md', 'r') do |f|
  f.each_line do |l|
    l.chomp
    list = l.split("#")
    list.reject(&:empty?)
    puts list
  end
end
