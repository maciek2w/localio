require 'localio/module'

class Locfile

  # Specify the target platform for the localizables
  #
  # possible values
  # :android, :ios, :php, :json, :yml
  dsl_accessor :platform

  # Specifies the filesystem path where the generated files will be
  dsl_accessor :output_path

  # Specifies the format for the keys in the localizable file
  #
  # smart : choose the formatting depending on the platform's best practices. This is the best option for multiplatform apps.
  # camel_case : camel case formatting (ie thisKindOfKeys)
  # snake_case : snake case formatting (ie this_kind_of_keys)
  # none : no formatting done, the keys will be used as
  dsl_accessor :formatting

  # Defined using 'source' ideally
  dsl_accessor :source_service, :source_path, :source_options

  def initialize
    @platform = nil
    @source_service = :google_drive
    @source_path = nil
    @source_options = nil
    @output_path = './out/'
    @formatting = :smart
  end

  # Defines the service storing the translations
  #
  # service
  #   :google_drive
  #
  # path : URL or system path storing the data
  # options : hash with extra options, view documentation for the different services
  def source(service, path, options = {})
    @source_service = service
    @source_path = path
    @source_options = options
  end

  def self.load(filename)
    dsl = new
    dsl.instance_eval(File.read(filename), filename)
    dsl
  end

end