module EtFullSystem
  module Test
    class VideoRecorder
      def initialize(host:, port:, filename:, dir:, password: 'secret')
        self.host = host
        self.port = port
        self.filename = "#{filename}.flv"
        self.dir = dir
        self.command = `which flvrec.py`.strip
        self.password_file = Tempfile.new
        password_file.write password
        password_file.close
      end

      def start
        return if command.empty?
        command_line = "#{command} -P #{password_file.path} -o #{file_path} #{host} #{port}"
        self.process = IO.popen(command_line)
        at_exit { stop }
      end

      def stop
        return if process.nil?
        Process.kill("INT", process.pid)
      end

      def discard
        FileUtils.rm file_path if File.exist?(file_path)
      end

      def save
        # At the moment it does nothing, but this stays in the API so we know whether to spend time
        # converting to more useful formats
      end

      private

      def file_path
        File.join(dir, filename)
      end

      attr_accessor :host, :filename, :dir, :port, :command, :process, :password_file
    end
  end
end