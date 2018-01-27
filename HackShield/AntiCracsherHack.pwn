/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
/*====================define====================*/
#define BulletCrasher -5.5
#define InvalidSeat1 -1000000.0
#define InvalidSeat2 1000000.0
/*==============================================*/

public OnPlayerUpdate(playerid){
	new Float:X,Float:Y,Float:Z;
	GetPlayerPos(playerid,X,Y,Z);
	if Z == BulletCrasher || !(InvalidSeat1 <= Z <= InvalidSeat2) *then {
		new tipcrasher[20];
		tipcrasher="BadVehicleCrasher";
		if Z == BulletCrasher *then tipcrasher="크래쉬 유발핵";
		new string[MAX_CHATBUBBLE_LENGTH];
		format(string,sizeof(string),"System: %s (%d)가 강제로 서버퇴장 처리 되었습니다. (%s)",PlayerName(playerid),playerid,tipcrasher);
		SendClientMessageToAll(0xFF0000FF,string);
		WriteLog(playerid);
		Kick(playerid);
		return false;
	}
	return true;
}

stock WriteLog(playerid)
{
    new sLogFileName[64], sLogData[128];
	new year,  month, day, hour, minute, second;
    getdate(year, month, day); gettime(hour, minute, second);
    format(sLogFileName, 64, "Log/CrashHack/%s(%d.%d.%d-%d:%d:%d) - CrashHack.log", PlayerName(playerid), year, month, day, hour, minute, second);
    new File:log=fopen(sLogFileName, io_append);
    format(sLogData,sizeof sLogData,"%s 가 크래쉬 유발핵을 사용함.  IP:%s\r\n",PlayerName(playerid),GetIP(playerid));
    fwrite(log, sLogData);
    fclose(log);
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	return name;
}

stock GetIP( playerid )
{
    new IPAddress[16];
    GetPlayerIp( playerid, IPAddress, 16 );
    return IPAddress;
}
