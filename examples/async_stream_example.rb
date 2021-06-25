$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pty'
require 'async'
require 'rbshodan'


client = Rbshodan.client.new

stats = Hash.new(0)

ports    = [21, 22, 80, 443]
services = ['ftp', 'ssh', 'http', 'https']