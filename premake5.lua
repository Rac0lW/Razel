workspace "Razel" 

	architecture "x86_64"

	startproject "Sandbox"

	configurations
	{
	"Debug",
	"Release",
	"Dist"
	}

outputdir="%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Razel"
	location "Razel"
	kind "SharedLib"
	language "C++"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src/Razel/vendor/spdlog/include",
		"%{prj.name}/vendor/spdlog/include",
		"%{prj.name}/src" 
	}

	filter "system:windows"

		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"RZ_PLATFORM_WINDOWS",
			"RZ_BUILD_DLL",
			"_WINDLL"
		}



		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
		}



	filter "configurations:Debug"
		defines "RZ_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "RZ_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "RZ_DIST"
		optimize "On"



project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{

		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/src/**.hpp"
	}



	includedirs
	{
		"Razel/src/Razel/vendor/spdlog/include",
		"Razel/vendor/spdlog/include",
		"Razel/src" 
	}



	links
	{
		"Razel"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"RZ_PLATFORM_WINDOWS",
		}



	filter "configurations:Debug"

		defines "RZ_DEBUG"

		symbols "On"

	



	filter "configurations:Release"

		defines "RZ_RELEASE"

		optimize "On"





	filter "configurations:Dist"

		defines "RZ_DIST"

		optimize "On"

	