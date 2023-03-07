#pragma once


#ifdef RZ_PLATFORM_WINDOWS

extern Razel::Application* Razel::CreateApplication();

int main(int argc, char** argv) {

	Razel::Log::Init();
	RZ_CORE_WARN("Initialized Log!");
	int a = 6;
	RZ_INFO("Hello! Var={0}", a);

	//Sandbox* sandbox = new Sandbox();
	auto app = Razel::CreateApplication();
	app->Run();
	delete app;  
} 

#endif