lines = []
open('Blog_Tags.md', 'r') do |f|
  f.each_line do |l|
    l.strip!
    lines << l if l != ""
  end
end

urls_with_tags = lines.map(&:strip).compact.map do |l|
  # Given a line that looks roughly like:
  # "# [[Weekly Drip 016.1] Data Structures, Old Programmers, Better Programmers, And Google Docs Hacks](https://www.dailydrip.com/blog/weekly-drip-016-1-data-structures-old-programmers-better-programmers-and-google-docs-hacks) #dev-news #weekly #data-structures #old-programmers #productivity #google-docs-hacks\n"
  #
  # - Get the url
  # - Get a list of tags
  # - return something like [url, [tag1, tag2]] for each line
  link_bit, tag_bit = l.split(")")
  # get the url
  _, url = link_bit.split("(")
  # get the tags
  tag_bit.strip!
  tags = tag_bit[1...-1].split("#").map(&:strip)
  [url, tags]
end

puts urls_with_tags.inspect
