require 'optionparser'
require_relative '../lib/generator.rb'

# Generator options
class Options
  OptionParser::new do |opts|
    help = <<~HELP
    .editorconfig generator for various languages and environments

    OPTIONS:
      --help     Prints this message
      --version  Prints script version

      LANGS:
        --rb     Ruby config
        --lua    Lua config
        --py     Python config
        --jl     Julia config
        --js     JavaScript config
        --ts     TypeScript config
        --hs     Haskell config
        --idr    Idris config
        --agda   Agda config
        --sml    StandardML config
        --ocaml  OCaml config
        --go     Go config (make)
        --zig    Zig config
        --rs     Rust config
        --c      C config (cmake)
        --cpp    C++ config (cmake)
        --cs     C# config
        --fs     F# config
        --kt     Kotlin config (gradle)
        --java   Java config (gradle)
        --scala  Scala config (sbt)
        --swift  Swift config
        --objc   Objective-C config

      ENVS:
        --web    HTML, CSS & JS config
        --rails  Ruby on Rails config
        --react  Reactjs config
        --xaml   C# with XAML

    USAGE:
      $ ./editorconfig.rb [option]

    HELP

    opts::on('', '--help') do
      puts(help)
    end

    opts::on('', '--version') do
      puts('v0.3')
    end

    opts::on('', '--rb') do
      Generator::lang_rb
    end

    opts::on('', '--lua') do
      Generator::lang_lua
    end

    opts::on('', '--py') do
      Generator::lang_py
    end

    opts::on('', '--jl') do
      Generator::lang_jl
    end

    opts::on('', '--js') do
      Generator::lang_js
    end

    opts::on('', '--ts') do
      Generator::lang_ts
    end

    opts::on('', '--hs') do
      Generator::lang_hs
    end

    opts::on('', '--idr') do
      Generator::lang_idr
    end

    opts::on('' ,'--agda') do
      Generator::lang_agda
    end

    opts::on('', '--sml') do
      Generator::lang_sml
    end

    opts::on('', '--ocaml') do
      Generator::lang_ocaml
    end

    opts::on('', '--go') do
      Generator::lang_go
    end

    opts::on('', '--zig') do
      Generator::lang_zig
    end

    opts::on('', '--rs') do
      Generator::lang_rs
    end

    opts::on('', '--c') do
      Generator::lang_c
    end

    opts::on('', '--cpp') do
      Generator::lang_cpp
    end

    opts::on('', '--cs') do
      Generator::lang_cs
    end

    opts::on('', '--fs') do
      Generator::lang_fs
    end

    opts::on('', '--kt') do
      Generator::lang_kt
    end

    opts::on('', '--java') do
      Generator::lang_java
    end

    opts::on('', '--scala') do
      Generator::lang_scala
    end

    opts::on('', '--swfit') do
      Generator::lang_swift
    end

    opts::on('', '--objc') do
      Generator::lang_objc
    end

    opts::on('', '--web') do
      Generator::env_web
    end

    opts::on('', '--rails') do
      Generator::env_rails
    end

    opts::on('', '--react') do
      Generator::env_react
    end

    opts::on('', '--xaml') do
      Generator::env_xaml
    end
  end.parse!
end
