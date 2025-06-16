package = "levents"
version = "0.1.0"
source = {
   url = "git+https://github.com/hexlua/levents.git"
}
description = {
   summary = "Basic events library like node.js EventEmitter class.",
   detailed = "Basic events library like node.js EventEmitter class.",
   homepage = "https://github.com/hexlua/levents",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      levents = "levents.lua"
   }
}