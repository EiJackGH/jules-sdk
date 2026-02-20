# ==========================================
# Jules SDK Build System
# ==========================================

# Compiler and Flags
CXX      := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -Iinclude
LDFLAGS  := -Llib
LDLIBS   := -lm

# Directories
SRC_DIR  := src
OBJ_DIR  := obj
BIN_DIR  := bin
INC_DIR  := include

# Target Name
TARGET   := $(BIN_DIR)/libjules_sdk.a

# Find all source files and map them to object files
SRCS     := $(wildcard $(SRC_DIR)/*.cpp)
OBJS     := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

# --- Rules ---

.PHONY: all clean install directories

all: directories $(TARGET)

# Create a static library (Common for SDKs)
$(TARGET): $(OBJS)
	ar rcs $@ $^
	@echo "Successfully built Jules SDK: $@"

# Compile source files into objects
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create necessary directories
directories:
	@mkdir -p $(OBJ_DIR) $(BIN_DIR)

# Clean build artifacts
clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
	@echo "Cleaned build artifacts."

# Install headers and library (Adjust prefix as needed)
PREFIX := /usr/local
install: all
	install -d $(PREFIX)/include/jules
	install -m 644 $(INC_DIR)/*.h $(PREFIX)/include/jules
	install -m 644 $(TARGET) $(PREFIX)/lib
	@echo "Jules SDK installed to $(PREFIX)"
