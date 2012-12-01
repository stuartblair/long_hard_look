require_relative 'file_adapter'

module LongHardLook
	class FilesystemAdapter
		def initialize(path)
			@path = path
		end

		def find(extension)
			Dir.glob("#{@path}/**/*.#{extension}").map do |path|
				FileAdapter.new(path, "")
			end
		end
	end
end

