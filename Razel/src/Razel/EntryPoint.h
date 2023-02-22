#pragma once


#ifdef RZ_PLATFORM_WINDOWS

extern Razel::Application* Razel::CreateApplication();

int main(int argc, char** argv) {
	//Sandbox* sandbox = new Sandbox();
	auto app = Razel::CreateApplication();
	app->Run();
	delete app;
}

#endif