#!/usr/bin/env ruby

require "date"

puts "Iniciando un nuevo post en ./_posts/"
puts ""

puts "Título del post:"
title = gets.chomp

puts ""
puts "Descripción del post:"
desc = gets.chomp

puts "Se creará archivo de post #{title} y Descripción #{desc}"

date_prefix = Date.today
name_suffix = title.gsub(" ", "-").downcase
file_name = "#{date_prefix}-#{name_suffix}"

puts "Nombre del archivo: #{file_name}"

contents = <<~EOT
---
layout: posts
title: #{title}
category: general
date: #{Time.now}
description: #{desc}
---
EOT

File.write("./_posts/#{file_name}.md", contents)

puts "Archivo para nuevo post creado."
