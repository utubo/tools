#!/usr/bin/ruby
#
# -*- coding: utf-8 -*-
#
# tool to color ruby logs

require "optparse"
REG = /^([A-Z]), \[([0-9]{4}-[0-9]{2}-[0-9]{2})[^\]]+\] +([A-Z]+) -- : (.+)/
REG_FATAL = /^[^.]+\.rb:[0-9]+: .+/
COLORS = { "D" => "\e[\033[36m", # sky
           "I" => "\e[\033[32m", # green
           "W" => "\e[\033[33m", # yellow
           "E" => "\e[\033[31m", # red
           "F" => "\e[\033[35m", # perple
           nil => "\e[\033[32m", # green
}

# -----------------------
is_print = true
show_level = "DIWEF"
opts = OptionParser.new
opts.on("-l=VAL", "Print Level\tDefault='D'") do |level|
	show_level.sub!(/^.+(#{level})/ , "\\1")
	is_print = false
end
show_date = nil
opts.on("-d=VAL", "") do |show_date|
	show_date = (Time.now - show_date.to_i).strftime("%Y-%m-%d")
end
opts.parse!(ARGV)

# -----------------------
begin
	while line = gets
		line.chop!
		if REG =~ line then
			level = $1
			date = $2
			is_print = /[#{show_level}]/ =~ level
		elsif REG_FATAL =~ line then
			level = 'F'
			is_print = /[#{show_level}]/ =~ level
		end
		print "#{COLORS[level]}#{line}\e[00m\n" if is_print
	end
rescue Interrupt
	print "\n"
end

