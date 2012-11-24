require 'trollop'

module LongHardLook
	class TextUI
		attr_reader :report, :format, :workspace

		def initialize
			options = Trollop::options do
				opt :report, "Report mode", :type => :string
				opt :format, "Report format", :type => :string, :default => "text"
				opt :workspace, "Workspace location", :type => :string
			end

			@report = options[:report]
			@format = options[:format]
			@workspace = options[:workspace]
		end
	end
end
