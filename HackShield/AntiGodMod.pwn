/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
/*====================new, forward====================*/
forward healthcheck();
/*====================================================*/

public healthcheck()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		new Float:phealth;
		GetPlayerHealth(i, phealth);
		if(phealth > 100)
		{
		    new PlayerName[200];
		    new string[200];
		    GetPlayerName(i, PlayerName, sizeof(PlayerName));
		    format(string, sizeof(string), "System: %s (%d) 가 무적핵 사용으로 자동밴 처리 됩니다. ", PlayerName, i);
		    SendClientMessageToAll(0xffffffff, string);
		    BanEx(i,string);
		}
	}
	return 1;
}
