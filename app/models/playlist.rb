class Playlist < ActiveRecord::Base
  belongs_to :user
  has_many :songs

  def dir_name
    name.strip do |name|
      # NOTE: File.basename doesn't work right with Windows paths on Unix
      # get only the filename, not the whole path
      name.gsub!(/^.*(\\|\/)/, '')

      # Strip out the non-ascii character
      name.gsub!(/[^0-9A-Za-z.\-]/, '_')
    end
  end

  def site_html
    template_html = File.read("./lib/templates/playlist_template.html.erb")
    playlist = self
    template = ERB.new(template_html)
    template.result(binding)
  end

  def mk_tmp_dir
    if !Dir.exists?("./tmp/#{dir_name}")
      Dir.mkdir("./tmp/#{dir_name}")
    end
  end

  def build_site
    File.open("./tmp/#{dir_name}/index.html", "w"){|f| f.write(site_html)}   
  end
  def rmx_url
    "#{dir_name.downcase.gsub(" ", "-")}.rmx.wtf"
  end
  
  def tmp_dir
    "./tmp/#{dir_name}"
  end

  def publish!
    ENV["PLAYLIST_ID"] = self.id.to_s
    status = system("rake playlist:build PLAYLIST_ID=#{self.id}")
    if status
      return true
    else
      return false
    end
  end

  def surge_deploy!
    status = system("surge --project '#{tmp_dir}' --domain '#{rmx_url}'")
    if status
      return true
    else
      abort 'the operation failed'
      return false
    end
  end
end