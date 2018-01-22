/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
/*====================new,forward=====================*/
new carspam[MAX_PLAYERS];
forward carspamming(playerid);
/*====================================================*/

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    carspam[playerid] ++;
    SetTimerEx("carspamming", 1000,false,"i",playerid);
    return 1;
}

public carspamming(playerid)
{
    carspam[playerid] --;
    if(carspam[playerid] > 10)
    {
        new string[128], PlayerName[MAX_PLAYER_NAME];
        GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
        format(string, sizeof(carspam), "System: %s Anit Car Spam 에 의해 자동으로 밴됩니다.", PlayerName);
        SendClientMessageToAll(-1, string);
        BanEx(playerid, "");
    }
    return 1;
}
