$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))
require 'gemmy'
require 'logger'

log = Logger.new(STDOUT)
log.level = Logger::INFO

Gemmy.geminabox_host_url = ENV['GEMINABOX_HOST_URL'] unless ENV['GEMINABOX_HOST_URL'].nil?
Gemmy.bucket_folder = ENV['BUCKET_FOLDER'] unless ENV['BUCKET_FOLDER'].nil?

log.info('[MONITOR] Monitoring file system for changes')

geminabox_client = Gemmy::GeminaboxClient.new(host: Gemmy.geminabox_host_url)

Gemmy::Monitor.new(location: Gemmy.bucket_folder).start do |file|
  begin
    gem_indexer = Gemmy::GemIndexer.new(geminabox_client: geminabox_client, gem: file)
    gem_indexer.perform
    FileUtils.rm file
    log.info("[MONITOR] #{file} successfully indexed")
  rescue => e
    log.info("[MONITOR] #{e.message} \n #{e.backtrace.join("\n")}")
  end
end