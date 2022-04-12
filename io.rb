require 'json'
require 'fileutils'
class FileManager
  def write(list, file)
    p (list)
    serializedlist = JSON.generate(list.map {|item| item.to_object}) 
    p serializedlist 
    FileUtils.touch(file) if !File.exists?(file) 
    File.write(file, serializedlist) 
  end
  def read(component, file)
    return if !File.exists?(file)
    content = File.read(file)
    list = JSON.parse(content)

    component.list = list.map {|item| Kernel.const_get(item['class_name']).new(item['opt'])} 
  end
end

