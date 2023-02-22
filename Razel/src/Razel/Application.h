#pragma once

#include "Core.h"

namespace Razel {

	class RAZEL_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	//To be define in client
	Application* CreateApplication();
}


