build:
	@gcc main.c -o bin\Tutorial.exe

run: build
	@cls
	@.\bin\Tutorial.exe
	@pause
	@cls
