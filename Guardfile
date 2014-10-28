guard :rspec, cmd: 'bin/rspec', all_after_pass: false do
  watch(%r{^spec/.+_spec\.rb$})

  watch("spec/spec_helper.rb")                          { "spec" }
  watch(%r{^spec/support/(.+)\.rb$})                    { "spec" }

  watch(%r{^app/(.+)\.rb$})                             { |m| "spec/#{m[1]}_spec.rb" }
  watch("app/controllers/application_controller.rb")    { "spec/controllers" }
  watch(%r{^app/controllers/(.+)_controller\.rb$})      { |m| "spec/controllers/#{m[1]}_controller_spec.rb" }

  watch(%r{^(lib/.+)\.rb$})                             { |m| "spec/#{m[1]}_spec.rb" }
end
