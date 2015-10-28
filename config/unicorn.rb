worker_processes 4
working_directory '/var/www/gemmy'
listen '/tmp/gemmy.web.sock', backlog: 2048
timeout 60
pid '/var/run/gemmy/web.pid'
stderr_path '/var/log/gemmy/unicorn.stderr.log'
stdout_path '/var/log/gemmy/unicorn.stdout.log'

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
    GC.copy_on_write_friendly = true

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end

  sleep 1
end