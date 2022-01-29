require "./scrape.rb"
require "sinatra"
require "json"

enable :method_override

class App < Sinatra::Application
    before do
        content_type :json
    end

    get "/" do
        jsonData = {
            "APIStatus" => "UP",
            "codedBy" => "Made with ❤️ by Vivek.",
            "reachMeAt" => "https://telegram.dog/pookie_0_0",
            "sourceCode" => "closed-source"
        }
        return jsonData.to_json
    end

    get "/all" do
        jsonData = {
            "category" => "all",
            "data" => scrape("")
        }
        return jsonData.to_json
    end

    get "/news" do
        _category = params[:category]
        available_category = ["national", "business", "sports", "world", "politics", "technology", "startup", "entertainment", "miscellaneous", "hatke", "science", "automobile"]
        if not available_category.include?_category
            status 404
            jsonData = {
                "error_code" => 404,
                "message" => "invalid category"
            }
            return jsonData.to_json
        end

        status 200
        jsonData = {
            "category" => _category,
            "data" => scrape(_category)
        }
        return jsonData.to_json
    end
end