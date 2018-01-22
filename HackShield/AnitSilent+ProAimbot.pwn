/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
/*====================new, forward====================*/
new SilentAimCount[MAX_PLAYERS];
new ProAimCount[MAX_PLAYERS];
new TintaApasata[MAX_PLAYERS];
/*====================================================*/

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    new string[200];
    if(weaponid != 38 && weaponid > 18 && weaponid < 34 && hittype == 1)
    {
        new Float:cood[6],Float:DistantaAim,armaaim[128];
        GetPlayerPos(hitid,cood[0],cood[1],cood[2]);
        DistantaAim = GetPlayerDistanceFromPoint(playerid,cood[0],cood[1],cood[2]);
        GetWeaponName(weaponid,armaaim,sizeof(armaaim));

        if(GetPlayerTargetPlayer(playerid) == INVALID_PLAYER_ID && DistantaAim > 1 && DistantaAim < 31 && TintaApasata[playerid] == 1)
        {
            SilentAimCount[playerid]++;
            if(SilentAimCount[playerid] >= 10)
            {
                SilentAimCount[playerid] = 0;
                format(string, sizeof(string), " %s(%d) 가 SilentAim을 사용하는것으로 의심됨.  %s (Distance: %i meters)", GetName(playerid),playerid, armaaim, floatround(DistantaAim));
                SendToAdmins(string);
            }
            return 1;
        }
        GetPlayerLastShotVectors(playerid, cood[0],cood[1],cood[2], cood[3],cood[4],cood[5]);
        if(!IsPlayerInRangeOfPoint(hitid, 3.0, cood[3],cood[4],cood[5]))
        {
            ProAimCount[playerid]++;
            if(ProAimCount[playerid] >= 5)
            {
                ProAimCount[playerid] = 0;
                format(string, sizeof(string), " %s(%d) 가 ProAim을 사용하는것으로 의심됨. %s (Distance: %i meters)", GetName(playerid),playerid,armaaim, floatround(DistantaAim));
                SendToAdmins(string);
            }
        }
    }
    return 1;
}

public OnPlayerKeyStateChange(playerid,newkeys,oldkeys)
{
    if(newkeys & KEY_HANDBRAKE && !IsPlayerInAnyVehicle(playerid)) TintaApasata[playerid] = 1;
    else if(oldkeys & KEY_HANDBRAKE) TintaApasata[playerid] = 0;
    return 1;
}

stock SendToAdmins(string2[])
{
    for(new i; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i) && IsPlayerAdmin(i))
        {
            SendClientMessage(i,0xE60000FF,string2);
        }
    }
}

stock GetName(playerid)
{
    new Name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, Name, sizeof(Name));
    return Name;
}
