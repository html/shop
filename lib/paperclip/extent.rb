# lib/paperclip_processors/transparent.rb
module Paperclip
  class Extent < Processor

    class InstanceNotGiven < ArgumentError; end

    def initialize(file, options = {},attachment = nil)
      super
      @file = file
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make
      dst = Tempfile.new([@basename, @format].compact.join("."))
      command = "#{@file.path}  -gravity center -extent 280x220 #{dst.path}"

      begin
        success = Paperclip.run("convert", command.gsub(/\s+/, " "))
      rescue PaperclipCommandLineError
        raise PaperclipError, "There was an error processing the watermark for #{@basename}" if @whiny_thumbnails
      end

      dst
    end

  end
end #
