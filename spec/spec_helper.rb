$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fileutils'

def silence_warnings(&block)
	warn_level = $VERBOSE
	$VERBOSE = nil
	result = block.call
	$VERBOSE = warn_level
	result
end

def clear_filesystem(file_system)
	FileUtils.rm_rf(file_system)
end

def push_edit_pop(directory)
	bookmark_directory = FileUtils.pwd
	FileUtils.mkdir_p(directory)
	FileUtils.chdir(directory)
	yield 
	FileUtils.chdir(bookmark_directory)
end


def within_workspace(workspace)
	push_edit_pop(workspace) do 
		yield
	end
end

def within_application_source_tree(application)
	push_edit_pop(application) do 
		yield
	end
end

def directory_for_package(package)
	package.gsub(/\./, '/')
end

def create_package(package)
	push_edit_pop(directory_for_package(package)) do 
		yield package
	end
end

def create_class(package, klass)
	File.open("#{klass}.java", 'w') do |file|
		file.write("package #{package};\n") do
			yeild file if block_given?
		end
	end
end

def create_file(name)
	File.open(name, 'w') do |file|
		file.write(yield) if block_given?
	end
end
