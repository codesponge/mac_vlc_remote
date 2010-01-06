require 'rubygems'
require 'sinatra'

set :public, File.dirname(__FILE__) + '/static'
set :port, 4666
def vlc_command(cmd)
  `osascript -e '
  tell application "VLC"
  #{cmd}
  end tell'
  `
  erb :index
end

get '/cmd/:cmd' do
    puts "command was #{params[:cmd]}"
    vlc_command(params[:cmd])
end

get '/*' do
  erb :index
end