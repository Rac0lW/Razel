#pragma once

#ifdef RZ_PLATFORM_WINDOWS
	#ifdef RZ_BUILD_DLL
		#define RAZEL_API __declspec(dllexport)
	#else
		#define RAZEL_API __declspec(dllimport)
	#endif
#else
	#error RAZEL ONLY SUPPORT WINDOWS!
#endif // RZ_BUILD_DLL
