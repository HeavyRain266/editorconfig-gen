# String colorizer
class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end
end

# TODO: Split into modules? i.e core, langs, envs
class Generator
  # Shared vars
  base = <<~BASE
  root = true

  [*]
  charset = utf-8
  indent_size = 4
  indent_style = space
  end_of_line = lf
  insert_final_newline = true
  trim_trailing_whitespace = true
  BASE

  twospaces = <<~TWOSPACES
  indent_size = 2
  indent_style = space
  TWOSPACES

  fourspaces = <<~FOURSPACES
  indent_size = 4
  indent_style = space
  FOURSPACES

  # Per language
  @ruby = <<~RB
  #{base}
  [*.rb]
  #{twospaces}
  [*.gemspec]
  #{twospaces}
  [Gemfile]
  #{twospaces}
  [Rakefile]
  #{twospaces}
  RB

  @lua = <<~LUA
  #{base}
  [*.lua]
  #{twospaces}
  LUA

  @python = <<~PY
  #{base}
  [*.py]
  #{fourspaces}
  [*.toml]
  #{fourspaces}
  PY

  @julia = <<~JL
  #{base}
  [*.jl]
  #{fourspaces}
  [*.toml]
  #{fourspaces}
  JL

  @javascript = <<~JS
  #{base}
  [*.js]
  block_comment_start = /**
  block_comment = *
  block_comment_end = */
  #{twospaces}
  [*.json]
  #{fourspaces}
  JS

  @typescript = <<~TS
  #{base}
  [*.ts]
  block_comment_start = /**
  block_comment = *
  block_comment_end = */
  #{twospaces}
  [*.json]
  #{fourspaces}
  TS

  @haskell = <<~HS
  #{base}
  [*.hs]
  #{fourspaces}
  HS

  @idris = <<~IDR
  #{base}
  [*.idr]
  #{fourspaces}
  IDR

  @agda = <<~AGDA
  #{base}
  [*.agda]
  #{fourspaces}
  AGDA

  @sml = <<~SML
  #{base}
  [*.ml]
  #{fourspaces}
  SML

  @ocaml = <<~ML
  #{base}
  [*.ml]
  #{fourspaces}
  [*.mli]
  #{fourspaces}
  ML

  @go = <<~GO
  #{base}
  [*.go]
  #{fourspaces}
  [Makefile]
  #{fourspaces}
  GO

  @zig = <<~ZIG
  #{base}
  [*.zig]
  #{fourspaces}
  ZIG

  @rust = <<~RS
  #{base}
  [*.rs]
  #{fourspaces}
  [*.toml]
  #{fourspaces}
  RS

  @c = <<~C
  #{base}
  [*.{c,h}]
  #{fourspaces}
  [*.build]
  #{twospaces}
  [Makefile]
  #{fourspaces}
  C

  @cpp = <<~CPP
  #{base}
  [*.{cpp,hpp}]
  #{fourspaces}
  [*.build]
  #{twospaces}
  [Makefile]
  #{fourspaces}
  CPP

  @csharp = <<~CS
  #{base}
  [*.cs]
  #{fourspaces}
  CS

  @fsharp = <<~FS
  #{base}
  [*.fs]
  #{fourspaces}
  FS

  @kotlin = <<~KT
  #{base}
  [*.kt]
  #{fourspaces}
  [*.kts]
  #{fourspaces}
  [*.gradle]
  #{fourspaces}
  KT

  @java = <<~JAVA
  #{base}
  [*.java]
  #{fourspaces}
  [*.kts]
  #{fourspaces}
  [*.gradle]
  #{fourspaces}
  JAVA

  @scala = <<~SCALA
  #{base}
  [*.scala]
  #{twospaces}
  [*.sbt]
  #{twospaces}
  SCALA

  @swift = <<~SWIFT
  #{base}
  [*.swift]
  #{fourspaces}
  [*.plist]
  #{twospaces}
  SWIFT

  @objc = <<~OBJC
  #{base}
  [*.m]
  #{fourspaces}
  [*.mm]
  #{fourspaces}
  OBJC

  # combined
  @web = <<~WEB
  #{base}
  [*.html]
  #{twospaces}
  [*.css]
  #{twospaces}
  [*.js]
  #{twospaces}
  WEB

  @rails = <<~RAILS
  #{base}
  [*.rb]
  #{twospaces}
  [Gemfile]
  #{twospaces}
  [Rakefile]
  #{twospaces}
  RAILS

  @react = <<~REACT
  #{base}
  [*.js]
  block_comment_start = /**
  block_comment = *
  block_comment_end = */
  #{twospaces}
  [*.json]
  #{fourspaces}
  [*.{jsx,tsx}]
  #{twospaces}
  REACT

  @xaml = <<~XAML
  [*.cs]
  #{fourspaces}
  [*.xaml]
  #{twospaces}
  XAML

  # Shared file
  @cfg = '.editorconfig'

  # Shared error
  @err = 'Error: file .editorconfig already exists and cannot be overwritten.'.red

  # Languages
  def self.lang_rb
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @ruby)
      puts 'Success: config for Ruby has been generated.'.green
    end
  end

  def self.lang_lua
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @lua)
      puts 'Success: config for Lua has been generated.'.green
    end
  end

  def self.lang_py
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @python)
      puts 'Success: config for Python has been generated.'.green
    end
  end

  def self.lang_jl
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @julia)
      puts 'Success: config for Julia has been generated.'.green
    end
  end

  def self.lang_js
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @javascript)
      puts 'Success: config for JavaScript has been generated.'.green
    end
  end

  def self.lang_ts
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @typescript)
      puts 'Success: config for TypeScript has been generated.'.green
    end
  end

  def self.lang_hs
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @haskell)
      puts 'Success: config for Haskell has been generated.'.green
    end
  end

  def self.lang_idr
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @idris)
      puts 'Success: config for Idris has been generated.'.green
    end
  end

  def self.lang_agda
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @agda)
      puts 'Success: config for Agda has been generated.'.green
    end
  end

  def self.lang_sml
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @sml)
      puts 'Success: config for StandardML has been generated.'.green
    end
  end

  def self.lang_ocaml
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @ocaml)
      puts 'Success: config for OCaml has been generated.'.green
    end
  end

  def self.lang_go
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, go)
      puts 'Success: config for Go has been generated.'.green
    end
  end

  def self.lang_zig
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @zig)
      puts 'Success: config for Zig has been generated.'.green
    end
  end

  def self.lang_rs
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @rust)
      puts 'Success: config for Rust has been generated.'.green
    end
  end

  def self.lang_c
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @c)
      puts 'Success: config for C has been generated.'.green
    end
  end

  def self.lang_cpp
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @cpp)
      puts 'Success: config for C++ has been generated.'.green
    end
  end

  def self.lang_cs
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @csharp)
      puts 'Success: config for C# has been generated.'.green
    end
  end

  def self.lang_fs
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @fsharp)
      puts 'Success: config for F# has been generated.'.green
    end
  end

  def self.lang_kt
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @kotlin)
      puts 'Success: config for Kotlin has been generated.'.green
    end
  end

  def self.lang_java
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @java)
      puts 'Success: config for Java has been generated.'.green
    end
  end

  def self.lang_scala
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @scala)
      puts 'Success: config for Scala has been generated.'.green
    end
  end

  def self.lang_swift
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @swift)
      puts 'Success: config for Swift has been generated.'.green
    end
  end

  def self.lang_objc
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @objc)
      puts 'Success: config for Objective-C has been generated.'.green
    end
  end

  # Environments
  def self.env_web
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @web)
      puts 'Success: config for Web environment has been generated.'.green
    end
  end

  def self.env_rails
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @rails)
      puts 'Success: config for Ruby on Rails environment has been generated.'.green
    end
  end

  def self.env_react
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @react)
      puts 'Success: config for Reactjs environment has been generated.'.green
    end
  end

  def self.env_xaml
    if File.exists?(@cfg)
      puts(@err)
    else File.write(@cfg, @xaml)
      puts 'Success: config for C# + XAML environment has been generated.'.green
    end
  end

end
