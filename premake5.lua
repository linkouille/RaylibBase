workspace "RayLibBase"
	architecture "x64"

	configurations 
	{ 
		"Debug", 
		"Release", 
		"Port" 
	}

outputDir = "build/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

includedirs
{
    -- Add external include directory here
	"includes/"
}

project "RayLibBase"

	kind "ConsoleApp"

	targetdir (outputDir)

	objdir (outputDir .. "/intermediate/")

	files
	{
		"includes/**.h",
		"sources/**.c",

		"includes/**.hpp",
		"includes/**.cpp"
	}
	
	includedirs
	{
		"includes/"
	}

  libdirs { 
  -- Add external lib directory here
    "lib"
  }

  links
  {
    -- Add link tag here
    "raylib",
    "GL",
    "m",
    "pthread",
    "dl",
    "X11"
  }

	filter "system:windows"
		-- cppdialect "C++20"

		systemversion "latest"

		defines{
			"PLATEFORM_WIN",
		}
		filter "action:vs2010"
			prebuildcommands 
			{
				-- Copy assets
				("xcopy /Y /E /H /C /I " .. "%{wks.location}assets\\ " .. "%{wks.location}Build\\%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}\\assets\\ ")
			}

 	filter "system:Unix"
		-- cppdialect "C++20"

		systemversion "latest"

		defines{
			"PLATEFORM_UNIX",
		}

	filter "configurations:Debug"
		defines "DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "RELEASE"
		optimize "Full"

	filter "configurations:Port"
		defines "PORT"
		optimize "On"

