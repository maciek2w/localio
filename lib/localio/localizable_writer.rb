require 'localio/writers/android_writer'
require 'localio/writers/ios_writer'

module LocalizableWriter
  def self.write(platform, languages, terms, path, formatter, options)
    case platform
      when :android
        AndroidWriter.write languages, terms, path, formatter, options
      when :ios
        IosWriter.write languages, terms, path, formatter, options
      when :json
        raise 'Not implemented yet'
      when :yml
        raise 'Not implemented yet'
      when :php
        raise 'Not implemented yet'
      else
        abort 'Platform not supported! Current possibilities are :android, :ios, :json, :yml, :php'
    end
  end
end