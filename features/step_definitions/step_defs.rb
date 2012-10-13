Given /^an Application Source Tree called (\S+)$/ do |application_source_tree|
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

When /^a Text Report is generated$/ do
	pending # express the regexp above with the code you wish you had
end

Then /^the Text Report looks like$/ do |content|
	pending # express the regexp above with the code you wish you had
end
