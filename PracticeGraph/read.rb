require 'fileutils'
class Read 
  def initialize(name_archive)
    read_archive(name_archive)
  end
  def read_archive(name_archive)
    content = File.read(name_archive) # lee el archivo
    lines = content.split("\n") # divide el contenido en líneas
    # recorre las líneas y las imprime
    lines.each do |line|
      puts line
    end
  end
end

