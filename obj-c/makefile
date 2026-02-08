#https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/

# Directories
SRCDIR := ./src
HDRDIR := $(SRCDIR)/include
ODIR   := ./obj
OUTDIR := ./out

# Final binary output
NAME :=exec
APP_PATH := $(OUTDIR)/$(NAME).app
TARGET := $(OUTDIR)/$(NAME)
TARGET_APP := $(APP_PATH)/Contents/MacOS/$(NAME)
PLIST_ELEMS :=\
	CFBundleName__-string__"$(NAME)"\
	CFBundleDisplayName__-string__"$(NAME)"\
	CFBundleIdentifier__-string__"com.example.$(NAME)"\
	CFBundleVersion__-string__"1.0-dev"\
	CFBundleExecutable__-string__"$(NAME)"\
	CFBundlePackageType__-string__"APPL"\
	NSPrincipalClass__-string__"NSApplication"

# Compiler and flags
CC := clang
CFLAGS := -I$(HDRDIR) -ObjC -Wall -Wextra
LIBS := -framework Cocoa

# Find all .c files in SRCDIR (recursively, if you want, use **/*.c instead)
SRC := $(shell find $(SRCDIR) -type f -name '*.m') #$(wildcard $(SRCDIR)/*.c)
# could be replaced by plain "main.c"

# Map each .c to its corresponding .o file in ODIR
OBJ := $(patsubst $(SRCDIR)/%.m, $(ODIR)/%.o, $(SRC))
# eg './$(src)</lib/test>.c' -> './$(obj)</lib/test>.o' only keep </lib/test>
# could be replaced by plain "main.o"
# Instead get, $SRC and create .o files accordingly : $(patsubst pattern, replacement, text) : /src/<main>.c -> /obj/<main>.o

# Find all .h files (used for dependency checking)
DEPS := $(wildcard $(HDRDIR)/*.h)
# could be replaced by plain "header.h"


## How to compile each object file
# kind of function for each *.o, with corresponding .c file
# $@ -> refers to %.o (<name>:arg)
# $< refers to %.c (name:<arg>)
# $(DEPS) unique purpose is for make to check if they're present and are not directly passed as argument for compilation
$(ODIR)/%.o: $(SRCDIR)/%.m $(DEPS)
# Creates dir of generated object
	@mkdir -p $(dir $@)
	$(CC) -c -o $@ $< $(CFLAGS)
#@echo "Compiled -> $@"

## How to build the final executable
$(TARGET): $(OBJ)
	@mkdir -p $(OUTDIR)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)
#@echo "Linked -> $@"

$(TARGET_APP): $(TARGET)
	@mkdir -p $(APP_PATH)/Contents
	@mkdir -p $(dir $@)
	@cp $(TARGET) $(TARGET_APP)
	@echo "Copied $(TARGET) to $(TARGET_APP)"

	@plutil -create xml1 $(APP_PATH)/Contents/Info.plist
	@$(foreach elem, $(PLIST_ELEMS),\
		plutil -insert $(subst __, ,$(elem)) $(APP_PATH)/Contents/Info.plist;)

# Default rule
all: $(TARGET)

asan: CFLAGS += -fsanitize=address
asan: $(TARGET)

app: $(TARGET_APP)

# Cleaning rules
.PHONY: clean

clean:
	rm -rf $(ODIR) $(OUTDIR)
	@echo "Cleaned build artifacts"