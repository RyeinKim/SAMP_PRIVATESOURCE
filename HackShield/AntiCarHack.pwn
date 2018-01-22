/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
/*====================new, forward====================*/
new	g_VehTime[MAX_PLAYERS];
forward OnPlayerChangeVehicle(playerid, vehicleid);
/*====================================================*/

public OnPlayerChangeVehicle(playerid, vehicleid)
{
    new string[256];
    new PlayerName[128];
    GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
	#pragma unused vehicleid
	if((GetTickCount() - g_VehTime[ playerid ]) < 500)
	{
	    SendClientMessage(playerid, 0xFF0000FF, "차량 클레오를 사용 하여 서비스 블럭 처리됩니다.");
		format(string, sizeof(string),"%s (%d) 가 서비스 블럭처리 되었습니다. [사유: 차량클레오]", PlayerName, playerid);
		SendClientMessageToAll(0xFF0000FF, string);
		BanEx(playerid, "");
	}
	g_VehTime[playerid] = GetTickCount();
	return 1;
}
