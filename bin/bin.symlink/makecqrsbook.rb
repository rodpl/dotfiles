#!/usr/bin/env ruby
# This script convers markdown book to one of the serveral e-book
# formats supported with calibre (http://calibre-ebook.com)
#
# Samples:
# 	
# Build e-book for amazon kindle
# 	$ make-ebook
# or
# 	$ FORMAT=mobi make-ebook
#
# Build e-book in 'epub' format
# 	$ FORMAT=epub make-ebook

require 'rubygems'
require 'rdiscount'
require 'ruby-debug'

format = ENV['FORMAT'] || 'mobi'
puts "using .#{format} (you can change it via FORMAT environment variable. try 'mobi' or 'epub')"
figure_title = 'Figure'

book_content = %(<html xmlns="http://www.w3.org/1999/xhtml"><head><title>CQRS Journey</title></head><body>)
dir = File.expand_path(File.join(File.dirname(__FILE__), ''))
  
Dir[File.join(dir, '**', '*.markdown')].sort.each do |input|
  puts "processing #{input}"
  content = File.read(input)
  content.gsub!(/Insert\s+(.*)(\.png)\s*\n?\s*#{figure_title}\s+(.*)/, '![\3](figures/\1-tn\2 "\3")')
  book_content << RDiscount.new(content).to_html
end

book_content << "</body></html>"
  
File.open("CQRSJourney.html", 'w') do |output|
  output.write(book_content)
end

system('ebook-convert', "CQRSJourney.html", "CQRSJourney.#{format}",
         '--cover', 'images/cover.png',
         '--authors', 'Adam Dymitruk & Ashic Mahtab & Bill Wilder & Bob Brumfield & Bruce Onder & Bruno Terkaly & Cesar De la Torre Llorente & Chris Martin & Chris Tavares & Christian Horsdal Gammelgaard & Christopher Bennage & Clemens Vasters & Craig Wilson & Daniel Piessens & David Hoerster & Dennis Kozora & Dennis van der Stelt & Dylan Smith & Ernst Perpignand & Eugenio Pace & Glenn Block & Greg Young & Ian Cooper & Jack Jones & James Nugent & James Tryand & Jeremie Chassaing & Jimmy Nilsson & Jonathan Oliver & Jorge Fioranelli & Josh Elster & Kelly Leahy & Kelly Sommers & Ksenia Mukhortova & Lars Wilhelmsen & Leandro Boffi & Mark Nijhof & Mark Seemann & Martijn van den Broek & Matias Woloski & Matt Hinze & Michael Stiefel & Mikael Östberg & Nuno Filipe Godinho & Peter Ritchie & Pieter Joost van de Sande & Ricardo Villalobos & Ritesh Rao & Scott Brown & Scott Cate & Scott Densmore & Shawn Hinsey & Shy Cohen & Simon Guindon & Szymon Pobiega & Tim Shakarian & Tom Janssens & Udi Dahan & Unai Zorrilla Castro & Yves Reynhout',
         '--series', 'Microsoft patterns & practices',
         '--comments', "©2012 Microsoft. All rights reserved. Certain content used with permission from contributors. Licensed under the Apache License, Version 2.0",
         '--level1-toc', '//h:h1', 
         '--level2-toc', '//h:h2', 
         '--level3-toc', '//h:h3',
         '--language', 'en')