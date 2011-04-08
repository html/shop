# lib/paperclip_processors/transparent.rb
module Paperclip
  class Transparent < Processor

    class InstanceNotGiven < ArgumentError; end

    def initialize(file, options = {},attachment = nil)
      super
      @file = file
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make
      dst = Tempfile.new([@basename, @format].compact.join("."))
      file_name = RAILS_ROOT + "/public/images/watermark_border2.png"
      command = "-transparent white " + File.expand_path(@file.path) + " " +File.expand_path(dst.path)
      command2 = File.expand_path(dst.path) + " #{file_name} " + File.expand_path(dst.path)

      begin
        success = Paperclip.run("convert", command.gsub(/\s+/, " ")) && Paperclip.run("composite", command2.gsub(/\s+/, " "))
      rescue PaperclipCommandLineError
        raise PaperclipError, "There was an error processing the watermark for #{@basename}" if @whiny_thumbnails
      end

      dst
    end

  end
end #
