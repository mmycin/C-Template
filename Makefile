build:
	@cmd /c echo Building...
	@cmd /c if not exist bin/ mkdir bin
	@g++ src\main.cpp lib\helper.cpp -I lib -o bin\app
	@cmd /c echo Building Successful

run: build
	@./bin/app

clean:
	@cmd /c echo Cleaning the project...
	@cmd /c if exist bin rmdir /s /q bin
	@cmd /c color 2
	@cmd /c echo Cleaning Success