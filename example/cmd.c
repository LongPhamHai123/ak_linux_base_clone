
#include <unistd.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "ak/ak.h"

#include "app.h"
// #include "app_if.h"
#include "app_dbg.h"

#include "cmd.h"
#include "task_list.h"

#include <sys/wait.h>
q_msg_t gw_task_cmd_mailbox;
void* gw_cmd_task(void) {
	wait_all_tasks_started();

	APP_DBG("[STARTED] gw_cmd_task\n");
    // execl("/bin/ls", "ls", NULL);
    FILE *fp = popen("ls", "r");
    char buffer[256];

    while (fgets(buffer, sizeof(buffer), fp) != NULL) {
        printf("%s", buffer);
    }

    pclose(fp);    
    // return 0;
	while (1) {        
        APP_DBG("cmd task running with thread id: %d\n", get_task_id());
        sleep(5);
	}
	return (void*)0;
}