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
			context 'with a single Java class declared' do
				it "returns the sole package" do
					@filesystem_adapter = double('filesystem_adapter')
					@java_file = double('java_file')
					@java_file.stub(:contents).and_return("package org.test;")
					@filesystem_adapter.stub(:find).with(:java).and_return([@java_file])
					@java_application = JavaApplication.new(@filesystem_adapter, 'AppA')
					@java_application.packages.should eql ["org.test"]
				end
			end
		end
	end
end

