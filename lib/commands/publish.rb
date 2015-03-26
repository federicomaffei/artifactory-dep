require 'net/http'
require 'uri'
require 'digest/md5'
require 'digest/sha1'

module Commands
	class Publish
		attr_accessor :file_path

		def initialize(args)
			@file_path, @format = args
		end

		def execute
			file_name = File.basename file_path
			folder_path = file_name.split(".")[0]
			puts ENV['ARTIFACTORY_PATH']
			artifactory_path = ENV['ARTIFACTORY_PATH'] + '/' + folder_path + '/' + file_name

			uri = URI.parse artifactory_path

			local_file = File.open file_path

			puts 'artifactory uploader'
			puts 'uploading to ' + artifactory_path + ' ...'

			http = Net::HTTP.new uri.host, uri.port
			puts uri.request_uri

			request = Net::HTTP::Put.new uri.request_uri
			request['X-Checksum-Md5'] = Digest::MD5.hexdigest File.read file_path 
			request['X-Checksum-Sha1'] = Digest::SHA1.hexdigest File.read file_path
			request['Content-Length'] = File.size local_file
			request.body_stream = local_file
			request.basic_auth ENV['ARTIFACTORY_USER'], ENV['ARTIFACTORY_PASS']
			response = http.request request

			puts response
			puts response.body
		end
	end
end