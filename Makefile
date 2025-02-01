build:
	mkdir bin
	gcc main.c -o bin\app.exe

run: build
	cls
	bin\app.exe
	pause
	cls
