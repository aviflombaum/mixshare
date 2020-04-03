ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


#namespace :db do
  # task :load_config do
  #   require_relative './config/environment'
  # end
#end

namespace :playlist do
  desc "Deploys Playlist to Surge via PLAYLIST_ID"
  task :build do
    if playlist = Playlist.find(ENV["PLAYLIST_ID"])
      playlist.mk_tmp_dir
      playlist.build_site

      # template_html = File.read("./lib/templates/playlist_template.html.erb")

      # template = ERB.new(template_html)
      # playlist_html = template.result(binding)

      # if !Dir.exists?("./tmp/#{playlist.dir_name}")
      #   Dir.mkdir("./tmp/#{playlist.dir_name}")
      # end

      # File.open("./tmp/#{playlist.dir_name}/index.html", "w"){|f| f.write(playlist_html)}   

      playlist.surge_deploy!

      # exec("surge --project './tmp/#{playlist.dir_name}' --domain '#{playlist.dir_name.downcase.gsub(" ", "-")}.rmx.wtf'")

      # sh %w(xxxxx) do |ok, res|
      #   if !ok
      #     abort 'the operation failed'
      #   end
      # end

    else
      puts "Can't find playlist"
    end
  end
end