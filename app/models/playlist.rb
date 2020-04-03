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

  def rmx_url
    "#{dir_name.downcase.gsub(" ", "-")}.rmx.wtf"
  end
  
  def tmp_dir
    "./tmp/#{dir_name}"
  end

    

  def publish!
    status = system("surge --project '#{tmp_dir}' --domain '#{rmx_url}'")
    if status
      puts "Project Deployed to #{rmx_url}"
    else
      abort 'the operation failed'
    end
  end
end