module LongHardLook
	class FileAdapter
		attr_reader :content

		def initialize(path, content)
			@path = path
			@content = content
		end

		def extension
			match_data = /.*\/.+\/.+\.(.+)/.match(@path)
			return nil if !match_data
			match_data[1]
		end
	end
end

