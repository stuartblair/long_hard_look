require_relative 'file_adapter'

module LongHardLook
	class FilesystemAdapter
		def initialize(path)
			@path = path
		end

		def find(extension)
			Dir.glob("#{@path}/**/*.#{extension}").map do |path|
				content = ""
				IO.readlines(path).each do |line| 
					content << line
				end
				FileAdapter.new(path, content)
			end
		end
	end
end

