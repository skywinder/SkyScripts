#!/usr/bin/env ruby

require 'fileutils'

def get_all_dirs_in_path(path_each_dir)
  # dirs = Dir.entries(path_each_dir).select { |x| File.directory? File.join(path_each_dir, x) and !(x =='.' || x == '..') }
  Dir.chdir(path_each_dir)
  dirs = Dir.glob('*').select { |f| File.directory? f }
  dirs.map! { |d| File.join(path_each_dir, d) }
end


# @param [Array] image_paths
# @param [String] path_each_dir
def run (image_paths, path_each_dir)
  full_img_paths = image_paths.map { |a|
    File.join(path_each_dir, a)
  }
  # puts full_img_paths
  dirs = get_all_dirs_in_path(path_each_dir)
  # puts dirs

  full_img_paths.each { |img|
    dirs.each { |d|
      # puts "img #{img} -> #{d}"
      begin

        FileUtils.cp img, d
      rescue
        puts "#{d} is already has images"
      end
    }
  }

end

if __FILE__ == $0
  run(["en-US/1_watch_1.IMG_0886.PNG", "en-US/2_watch_2.IMG_0887.PNG"], "/Users/petrkorolev/repo/forex-tools/fastlane/screenshots")

end