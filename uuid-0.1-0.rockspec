package = "uuid"
version = "0.1-0"

source = {
	url = "git://github.com/tacigar/lua-uuid",
	tag = "v0.1",
}

description = {
	summary = "Lua UUID Module",
     	detailed = "This library provides UUID module.",
     	homepage = "https://github.com/tacigar/lua-uuid",
     	license = "GPLv3",
}

dependencies = {
	"lua >= 5.2"
}

build = {
	type = "builtin",
	modules = {
		["uuid"] = "uuid.c",
	}
}
