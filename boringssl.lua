-- scaffold geniefile for boringssl

boringssl_script = path.getabsolute(path.getdirectory(_SCRIPT))
boringssl_root = path.join(boringssl_script, "boringssl")

boringssl_includedirs = {
	path.join(boringssl_script, "config"),
	boringssl_root,
}

boringssl_libdirs = {}
boringssl_links = {}
boringssl_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { boringssl_includedirs }
	end,

	_add_defines = function()
		defines { boringssl_defines }
	end,

	_add_libdirs = function()
		libdirs { boringssl_libdirs }
	end,

	_add_external_links = function()
		links { boringssl_links }
	end,

	_add_self_links = function()
		links { "boringssl" }
	end,

	_create_projects = function()

project "boringssl"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		boringssl_includedirs,
	}

	defines {}

	files {
		path.join(boringssl_script, "config", "**.h"),
		path.join(boringssl_root, "**.h"),
		path.join(boringssl_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
