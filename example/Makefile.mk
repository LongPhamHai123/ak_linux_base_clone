-include Config.mk

NAME_MODULE = $(EXAMPLE_DIR)/example
NAME_STATIC_MODULE = libak.a

LDFLAGS += -L/mnt/local/lib -Wl,-rpath=/mnt/local/lib
LDLIBS += -lak

OBJ += 	$(EXAMPLE_DIR)/main.o \
		$(EXAMPLE_DIR)/task_list.o \
		$(EXAMPLE_DIR)/task_1.o \
		$(EXAMPLE_DIR)/task_2.o 

all: $(NAME_MODULE)

$(EXAMPLE_DIR)/%.o: %.c
	@echo CC 	$<
	@$(CC) -c -o $@ $< $(CFLAGS) $(LDFLAGS)

$(NAME_MODULE): $(OBJ)
	@echo ---------- START LINK EXAMPLE ----------
	@echo CC 	$^ -o $@
	@$(CC) -o $@ $^ -L/mnt/local/lib -Wl,-rpath=/mnt/local/lib -lak
	
clean:
	@echo rm -rf $(EXAMPLE_DIR)/$(OBJ)
	@rm -rf $(OBJ)
	@rm -rf $(NAME_MODULE)