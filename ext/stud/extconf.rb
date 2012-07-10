require "mkmf"
require "fileutils"


def sys(cmd)
  puts "system command:  #{cmd}"
  unless ret = xsystem(cmd)
    raise "system command `#{cmd}' failed"
  end
  ret
end


here = File.expand_path(File.dirname(__FILE__))
stud_tarball = "#{here}/stud.tar.gz"

Dir.chdir(here) do
  sys("tar -zxf #{stud_tarball}")
  Dir.chdir("stud") do
    sys("make")
    FileUtils.mv "stud", "../../../bin/oversip_stud"
  end

  FileUtils.remove_dir("stud", force = true)
end

create_makefile("stud")
