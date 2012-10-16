Given /^an application source tree called (\S+)$/ do |application_source_tree|
	@application_source_tree = application_source_tree
end

Given /^AppA contains the package (\S+)$/ do |java_package|
	within_workspace('test_workspace') do
		within_application_source_tree(@application_source_tree) do 
			create_package(java_package) do |package|
				create_class(package, 'Main') do
				end
			end
		end
	end
end

When /^I generate a (\S+) report of (\S+)$/ do |format, report|
	run_simple("ruby -I#{path_to('lib')} #{path_to('bin')}/long_hard_look --report=#{report} --format=#{format} test_workspace", false) 
end

Then /^the output should contain exactly$/ do |exact_output|
	all_output.should == exact_output
end
