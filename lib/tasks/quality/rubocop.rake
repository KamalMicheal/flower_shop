namespace :quality do
  begin
    require 'rubocop/rake_task'

    RuboCop::RakeTask.new(:rubocop) do |task|
      task.patterns = %w[
        **/*.rb
        --force-exclusion
        --config .rubocop.yml
      ]
    end
  rescue LoadError
    warn "rubocop not available, rake task not provided."
  end
end
