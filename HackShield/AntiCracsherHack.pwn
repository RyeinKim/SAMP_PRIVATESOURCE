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
		if Z == BulletCrasher *then tipcrasher="ũ���� ������";
		new string[MAX_CHATBUBBLE_LENGTH];
		format(string,sizeof(string),"System: %s (%d)�� ������ �������� ó�� �Ǿ����ϴ�. (%s)",GetName(playerid),playerid,tipcrasher);
		SendClientMessageToAll(0xFF0000FF,string);
		Kick(playerid);
		return false;
	}
	return true;
}

stock GetName(playerid)
{
	new Name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, Name, sizeof(Name));
	return Name;
} 
