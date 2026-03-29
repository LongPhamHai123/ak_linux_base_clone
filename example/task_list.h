
#ifndef __TASK_LIST_H__
#define __TASK_LIST_H__

#include "ak/ak.h"
#include "task_1.h"
#include "task_2.h"
#include "task_3.h"
#include "if_console.h"
#include "task_console.h"
#include "if_put_console.h"
#include "cmd.h"
enum {
	/* SYSTEM TASKS */
	DEFAULT_AK_FIRST_TASK = AK_TASK_TIMER_ID,

	/* APP TASKS */
	GW_TASK_APP_1,
	GW_TASK_APP_2,
	GW_TASK_APP_3,
	GW_TASK_IF_CONSOLE_ID,
	GW_TASK_CONSOLE_ID,
	GW_TASK_IF_PUT_CONSOLE_ID,
	GW_TASK_CMD_ID,
	/* EOT task ID */
	AK_TASK_LIST_LEN,
};

extern ak_task_t task_list_init[];

#endif


