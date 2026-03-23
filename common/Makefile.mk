-include Config.mk
CFLAGS	+= -I./common
VPATH += ./common
OBJ += $(OBJ_DIR)/cmd_line.o

