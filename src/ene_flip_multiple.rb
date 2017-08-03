# Eneroth Flip Multiple

# Copyright Julia Christina Eneroth, eneroth3@gmail.com

require "sketchup.rb"
require "extensions.rb"

module EneFlipMultiple

  PLUGIN_ID = File.basename(__FILE__, ".rb")
  PLUGIN_DIR = File.join(File.dirname(__FILE__), PLUGIN_ID)
  REQUIRED_SU_VERSION = 6

  EXTENSION = SketchupExtension.new(
    "Eneroth Flip Multiple",
    File.join(PLUGIN_DIR, "main")
  )
  EXTENSION.creator     = "Julia Christina Eneroth"
  EXTENSION.description =
    "Bulk flip groups and components along their individual axes."
  EXTENSION.version     = "1.0.0"
  EXTENSION.copyright   = "#{EXTENSION.creator} 2017"
  Sketchup.register_extension(EXTENSION, true)

end
