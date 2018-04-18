require_relative './test_common'
record_video_mode = ENV.fetch('RECORD_VIDEO', 'on_failure')  # Can be 'on_failure', 'false', 'true', '@tagname,@other_tagname'
selenium_url = ENV.fetch('SELENIUM_URL', 'http://localhost:4444/wd/hub')
if selenium_url || ENV.key?('RECORD_VNC_FROM')
  selenium_host = URI.parse(selenium_url).host
  vnc_uri = URI.parse(ENV.fetch('RECORD_VNC_FROM', "vnc://#{selenium_host}:5900"))

  Before('@e2e') do |scenario|
    case record_video_mode
    when 'false' then next
    when /@/
      next unless scenario.match_tags?(record_video_mode)
    end

    time_now = Time.now
    filename_prefix = "video"
    timestamp = "#{time_now.strftime('%Y-%m-%d-%H-%M-%S.')}#{'%03d' % (time_now.usec/1000).to_i}"
    filename = "#{filename_prefix}_#{timestamp}"
    @video_recorder = EtFullSystem::Test::VideoRecorder.new(host: vnc_uri.host, port: vnc_uri.port, filename: filename, dir: Capybara::Screenshot.capybara_root) unless record_video_mode=='false'
    @video_recorder.start
  end

  After('@e2e') do |scenario|
    next if record_video_mode == 'false' || @video_recorder.nil?
    @video_recorder.stop
    if record_video_mode == 'on_failure' && scenario.failed?
      @video_recorder.save
    elsif record_video_mode == 'true'
      @video_recorder.save
    elsif record_video_mode =~/@/ && scenario.match_tags?(record_video_mode)
      @video_recorder.save
    else
      @video_recorder.discard

    end
  end
end
