#include "task_3.h"
#include "raylib.h"
q_msg_t gw_task_app3_mailbox;

void* gw_task_app3_entry(void) {
	wait_all_tasks_started();

	AK_PRINT("[STARTED] gw_task_app3_entry\n");

	ak_msg_t* msg;

	// timer_set(GW_TASK_APP_2, 0, 1000, TIMER_PERIODIC);
    // const int screenWidth = 800;
    // const int screenHeight = 450;

    // InitWindow(screenWidth, screenHeight, "Simple 2D Game");

    // // Player
    // Rectangle player = {100, 200, 40, 40};
    // float speed = 5;

    // // Enemy
    // Rectangle enemy = {600, 200, 40, 40};
    // float enemySpeed = 3;

    // SetTargetFPS(60);

    // while (!WindowShouldClose())
    // {
    //     // Player movement
    //     if (IsKeyDown(KEY_RIGHT)) player.x += speed;
    //     if (IsKeyDown(KEY_LEFT))  player.x -= speed;
    //     if (IsKeyDown(KEY_UP))    player.y -= speed;
    //     if (IsKeyDown(KEY_DOWN))  player.y += speed;

    //     // Enemy movement
    //     enemy.x -= enemySpeed;

    //     if (enemy.x < 0)
    //         enemy.x = screenWidth;

    //     // Collision
    //     bool collision = CheckCollisionRecs(player, enemy);

    //     BeginDrawing();
    //     ClearBackground(RAYWHITE);

    //     DrawRectangleRec(player, BLUE);
    //     DrawRectangleRec(enemy, RED);

    //     if (collision)
    //     {
    //         DrawText("GAME OVER", 320, 200, 30, BLACK);
    //     }

    //     DrawText("Move: Arrow Keys", 10, 10, 20, DARKGRAY);

    //     EndDrawing();
    // }

    // CloseWindow();


	while (1) {
        msg = ak_msg_rev(GW_TASK_APP_3);
        ak_msg_free(msg);
	}

	return (void*)0;
}