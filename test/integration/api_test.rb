require 'test_helper'

class ApiTest < ActionDispatch::IntegrationTest
	
	test "can't create note with empty content" do
		note_params = {
			"note" => {
				"title" => "test",
				"content" => ""
			}
		}.to_json

		request_headers = {
		  "Accept" => "application/json",
      "Content-Type" => "application/json"
    }

		post "/notes",
		  params: note_params,
		  headers: request_headers

		assert_response :unprocessable_entity
	end

	test "can't create note with empty title" do
		note_params = {
			"note" => {
				"title" => "",
				"content" => "test"
			}
		}.to_json

		request_headers = {
		  "Accept" => "application/json",
      "Content-Type" => "application/json"
    }

		post "/notes",
		  params: note_params,
		  headers: request_headers

		assert_response :unprocessable_entity
	end

	test "can't create tag without a name" do

		tag_params = {
			"tag" => {
				"name" => ""
			}
		}.to_json

		request_headers = {
			"Accept" => "application/json",
			"Content-Type" => "application/json"
		}

		post "/notes/1/tags",
			params: tag_params,
			headers: request_headers

		assert_response :unprocessable_entity
	end
end