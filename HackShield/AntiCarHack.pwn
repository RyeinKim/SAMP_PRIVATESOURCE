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
	    SendClientMessage(playerid, 0xFF0000FF, "���� Ŭ������ ��� �Ͽ� ���� �� ó���˴ϴ�.");
		format(string, sizeof(string),"%s (%d) �� ���� ��ó�� �Ǿ����ϴ�. [����: ����Ŭ����]", PlayerName, playerid);
		SendClientMessageToAll(0xFF0000FF, string);
		BanEx(playerid, "");
	}
	g_VehTime[playerid] = GetTickCount();
	return 1;
}
