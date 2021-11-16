require 'optionparser'
require_relative 'generator.rb'

class Options
  OptionParser.new do |opts|

    # Initialize config class
    Generator.new

    help = <<~HELP
    Generator for Editorconfig

    OPTIONS:
      -h,   --help      Prints this message
      -v,   --version   Prints script version

      -r,   --ruby      Generate config for Ruby scripts
      -l,   --lua       Generate config for Lua scripts
      -p,   --python    Generate config for Python scripts
      -g,   --golang    Generate config for Go Programs
      -c,   --clang     Generate config for C Programs
      -cpp, --cplusplus Generate config for C++ Programs
      -w,   --web       Generate config for Web environment

    USAGE:
      $ ./editorconfig.rb [option]
    HELP

    opts.on('-h', '--help') do
      puts(help)
    end

    opts.on('-v', '--version') do
      puts 'v0.2'
    end

    opts.on('-r', '--ruby') do
      Generator.lang_rb
    end

    opts.on('-l', '--lua') do
      Generator.lang_lua
    end

    opts.on('-p', '--python') do
      Generator.lang_py
    end

    opts.on('-g', '--golang') do
      Generator.lang_go
    end

    opts.on('-c', '--clang') do
      Generator.lang_c
    end

    opts.on('-cpp', '--cplusplus') do
      Generator.lang_cpp
    end

    opts.on('-w', '--web') do
      Generator.env_web
    end

  end.parse!
end