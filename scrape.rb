require "nokogiri"
require "httparty"

def scrape(category)
    data = []
    url = "https://inshorts.com/en/read/#{category}"
    response = Nokogiri::HTML(HTTParty.get(url).body)
    card_stacks = response.css("div.card-stack").css("div.news-card")
    card_stacks.each do |card|
        begin
            thumbnail = card.css("div.news-card-image")[0]["style"].split("'")[1]
        rescue
            thumbnail = nil
        end
        begin
            title =  title = card.css("a.clickable").text.strip()
        rescue
            title = nil
        end
        begin
            stuff = card.css("div.news-card-author-time-in-title")
            short_url = "https://inshorts.com" + stuff.css("a")[0]["href"]
        rescue
            short_url = nil
        end
        begin
            spans = stuff.css("span")    
            author = spans[1].text.strip()
            time = spans[2].text.strip()
            date = spans[3].text.strip().sub(",", ", ")
        rescue
            author, time, date = nil
        end
        begin
            content = card.css("div.news-card-content").css("div[itemprop]").text.strip()
        rescue
            content = nil
        end
        begin
            source = card.css("a.source")[0]["href"].strip()
        rescue
            source = nil
        end
        temp = {
            "title" => title,
            "thumbnail" => thumbnail,
            "content" => content,
            "shortUrl" => short_url,
            "author" => author,
            "time" => time,
            "date" => date,
            "source" => source
        }
        data.append(temp)
    end
    return data
end