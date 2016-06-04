.PHONY: test build

test: build
	@swift test > TestLog.txt && (echo "All tests passed"; rm TestLog.txt) || (echo "Warning: Test failures. Dumped to TestLog.txt" && cat TestLog.txt)

build:
	@echo "Building project..."
	@swift build > BuildLog.txt && (echo "Build successful"; rm BuildLog.txt) || (echo "Error: Build failed. Dumped to BuildLog.txt" && cat BuildLog.txt)
