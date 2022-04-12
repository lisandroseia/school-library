require 'json'
require 'fileutils'
class FileManager
  def write(list, file)
    serializedlist = JSON.generate(list)
    if !File.exists?(file) 
      FileUtils.touch(file)
    end
    File.write(file, serializedlist)
  end

end