require 'spec_helper'
require 'long_hard_look/package_report'

module LongHardLook
	describe PackageReport do
		before(:each) do
			@ui = double('ui')
			@java_application = double('java_application')
			@package_report = PackageReport.new(@ui, @java_application)
		end

		describe "#run" do
			it "creates the expected report" do
				@ui.stub(:workspace).and_return("/home/stuart/test_workspace")
				@java_application.stub(:name).and_return("AppA");
				@java_application.stub(:packages).and_return(["org.test"])
				@ui.should_receive(:render).with(<<OUTPUT
Packages by application source tree
___________________________________
AppA
* org.test
OUTPUT
																				)
				@package_report.run
			end
		end
	end 
end
