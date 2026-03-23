-include Config.mk
CFLAGS	+= -I./common
VPATH += ./common
OBJ += $(EXAMPLE_DIR)/cmd_line.o

