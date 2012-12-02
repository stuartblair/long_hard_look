require 'trollop'

module LongHardLook
	class TextUI
		attr_reader :report, :format, :workspace, :application

		def initialize(args=ARGV)
			options = Trollop::options(args) do
				opt :report, "Report mode", :type => :string
				opt :format, "Report format", :type => :string
				opt :workspace, "Workspace location", :type => :string
				opt :application, "Application", :type => :string
			end

			@report = options[:report]
			@format = options[:format]
			@workspace = options[:workspace]
			@application = options[:application]
		end

		def render(output)
			puts output
		end
	end
end
