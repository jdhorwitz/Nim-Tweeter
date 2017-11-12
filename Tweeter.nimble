# Package

version       = "0.1.0"
author        = "Josh Horwitz"
description   = "Simple twitter clone"
license       = "MIT"

bin = @["tweeter"]
skipExt = @["nim"]
# Dependencies

requires "nim >= 0.17.2", "jester >= 0.0.1"

