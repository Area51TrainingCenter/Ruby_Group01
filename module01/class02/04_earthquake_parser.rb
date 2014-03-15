require 'json'

# Con datos externos
web_site = open("http://earthquake-report.com/feeds/recent-eq?json")
items = JSON.parse(web_site.read)
items.first

items.select{|item| item["magnitude"].to_f > 5 && item["location"] =~ /Peru/  }


# Y con datos locales
data = File.read("data.txt")
items = JSON.parse(data)
items.first
items.select{|item| item["magnitude"].to_f > 5 && item["location"] =~ /Peru/  }
