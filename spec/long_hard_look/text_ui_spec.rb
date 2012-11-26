require 'spec_helper'
require 'long_hard_look/text_ui'
module LongHardLook
	describe TextUI do
		context "when valid commandline is provided" do
			around(:each) do |noisy_example|
				#ARGV is a constant, so our test setup is going to result in some
				#warnings. Let's temporarily disable the warnings for this context.
				silence_warnings { noisy_example.run }
			end

			before(:each) do
				ARGV = ["--report=package_report", "--format=text", "--workspace=/home/stuart/test_workspace"]
			end

			it "maps the report type correctly" do
				TextUI.new.report.should eql "package_report"
			end

			it "maps the format type correctly" do
				TextUI.new.format.should eql "text"
			end

			it "maps the workspace correctly" do
				TextUI.new.workspace.should eql "/home/stuart/test_workspace"
			end
		end
	end
end
