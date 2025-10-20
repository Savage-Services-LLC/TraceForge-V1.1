#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'fileutils'

API_ENDPOINT = 'http://localhost:3000/api/v1/scrape'
LOG_PATH = '/data/data/com.termux/files/home/TraceForge-V1.1/logs/scrape.log'

def log(msg)
  FileUtils.mkdir_p(File.dirname(LOG_PATH))
  File.open(LOG_PATH, 'a') { |f| f.puts "[#{Time.now.utc}] #{msg}" }
  puts msg
end

def trigger_scrape(url)
  uri = URI.parse(API_ENDPOINT)
  res = Net::HTTP.post_form(uri, { 'url' => url })

  if res.is_a?(Net::HTTPSuccess)
    log "✓ Scrape triggered for: #{url}"
    log "→ Response: #{res.body}"
  else
    log "✗ Failed to trigger scrape: #{res.code} #{res.message}"
  end
end

if ARGV.empty?
  puts "Usage: traceforge_scrape.rb <URL>"
  exit
end

trigger_scrape(ARGV[0])
