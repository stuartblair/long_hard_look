module LongHardLook
	class JavaApplication
		attr_reader :name

		def initialize(filesystem_adapter, name)
			@name = name
			@filesystem_adapter = filesystem_adapter
		end

		def packages
			packages = []
			@filesystem_adapter.find(:java).each do |java_file|
				packages << extract_package(java_file)
			end
			packages.uniq
		end

		private

		def extract_package(java_file)
			/\s*package (.+);/.match(java_file.contents)[1]
		end
	end
end
