#include "task_list.h"

ak_task_t task_list_init[] = {
	/* SYSTEM TASKS */
	{	DEFAULT_AK_FIRST_TASK,	TASK_PRI_LEVEL_1,	timer_entry     ,	&timer_mailbox		,	"timer service"			},

	/* APP TASKS */
	{	GW_TASK_APP_1,	TASK_PRI_LEVEL_1,	gw_task_app1_entry	,	&gw_task_app1_mailbox,	"handle commands"			},
	{	GW_TASK_APP_2,	TASK_PRI_LEVEL_1,	gw_task_app2_entry	,	&gw_task_app2_mailbox,	"handle commands"			},
	{	GW_TASK_APP_3,	TASK_PRI_LEVEL_1,	gw_task_app3_entry	,	&gw_task_app3_mailbox,	"Game ming"			},
	{	GW_TASK_IF_CONSOLE_ID,	TASK_PRI_LEVEL_1,	gw_task_if_console_entry	,	&gw_task_if_console_mailbox,	"Receive cmd"			},
	{	GW_TASK_CONSOLE_ID,	TASK_PRI_LEVEL_1,	gw_task_console_entry	,	&gw_task_console_mailbox,	"Handle cmd"			},
	{	GW_TASK_IF_PUT_CONSOLE_ID,	TASK_PRI_LEVEL_7,	gw_task_if_put_console_entry	,	&gw_task_if_put_console_mailbox,	"Put cmd"			},

	{	GW_TASK_CMD_ID,	TASK_PRI_LEVEL_1,	gw_cmd_task	,	&gw_task_cmd_mailbox,	"cmd task"			},
};