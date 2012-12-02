require 'long_hard_look/java_application'

module LongHardLook
	describe JavaApplication do
		describe '#name' do
			it "returns the name of the application" do
				@java_application = JavaApplication.new(@filesystem_adapter, 'AppA')
				@java_application.name.should eql 'AppA'
			end
		end

		describe '#packages' do
			before(:each) do
				@filesystem_adapter = double('filesystem_adapter')
				@java_application = JavaApplication.new(@filesystem_adapter, 'AppA')
			end

			context 'with a single Java class defined without a package' do
				it "returns an empty array" do
					@filesystem_adapter.stub(:find).with(:java).and_return([double(:content => "//Top Level class")])
					@java_application.packages.should eql []
				end
			end
			
			context 'with a single Java class declared' do
				it "returns the sole package" do
					@filesystem_adapter.stub(:find).with(:java).and_return([double(:content => "package org.test;")])
					@java_application.packages.should eql ["org.test"]
				end
			end

			context 'with two Java classes in the same package' do
				it "returns the sole package" do
					@filesystem_adapter.stub(:find).with(:java).and_return([double(:content => "package org.test;")] * 2)
					@java_application.packages.should eql ["org.test"]
				end
			end

			context 'with no Java classes' do
				it "returns an empty array" do
					@filesystem_adapter.stub(:find).with(:java).and_return([])
					@java_application.packages.should eql []
				end
			end
		end
	end
end

