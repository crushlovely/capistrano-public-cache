namespace :public_cache do
  desc <<-DESC
    Build your cache.

    By default this task will do nothing. At the bare minimum, you must
    configure the following options:

      set :public_cache_base_url, '' # the public base URL of your application
      set :public_cache_files, {}    # the source and destination paths of the
                                     # files you want to cache.

    See README.md for more information on these options.
  DESC
  task :build do
    on roles fetch(:public_cache_roles) do
      fetch(:public_cache_files).each do |source_path, destination_path|
        source = [fetch(:public_cache_base_url), source_path].join
        public_path = release_path.join('public')
        execute :curl, source, '>', public_path.join(destination_path)
      end
    end
  end

  after 'deploy:published', 'public_cache:build'
end

namespace :load do
  task :defaults do
    set :public_cache_roles, :web
    set :public_cache_base_url, ''
    set :public_cache_files, {}
  end
end
