/*
	fn_slotMachineRewards.sqf
	Author: Steven for WolfPack Server
	Description: Figure it out.
	lemon = 0
	melon = 1
	cherry = 2
	Wolfpack = 3
*/
params [
	["_idxA",-1,[0]],
	["_idxB",-1,[0]],
	["_idxC",-1,[0]],
	["_slotType",0,[0]]
];

if (_idxA == -1 || _idxB == -1 || _idxC == -1) exitWith {[]};

private _ret = 0;

if (_idxA == 8 && _idxB == 8 && _idxC == 8)then//                      (BAR , BAR , BAR)
{
   if (_slotType == 0)then {_ret = 40000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 200000;};   //average joe's
   if (_slotType == 2)then {_ret = 400000;};  //high roller's
};
       
if (_idxA == 7 && _idxB == 7 && _idxC == 7)then//                      (7 , 7 , 7)
{
   if (_slotType == 0)then {_ret = 18000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 90000;};   //average joe's
   if (_slotType == 2)then {_ret = 180000;};  //high roller's
};

if (_idxA == 6 && _idxB == 6 && _idxC == 6)then//                      (DIAMOND , DIAMOND , DIAMOND)
{
   if (_slotType == 0)then {_ret = 12000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 60000;};   //average joe's
   if (_slotType == 2)then {_ret = 120000;};  //high roller's
};
         
if (_idxA == 5 && _idxB == 5 && _idxC == 5)then//                      (BELL , BELL , BELL)
{
   if (_slotType == 0)then {_ret = 10000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 50000;};   //average joe's
   if (_slotType == 2)then {_ret = 100000;};  //high roller's
};

if (_idxA == 4 && _idxB == 4 && _idxC == 4)then//                      (GLASS , GLASS , GLASS)
{
   if (_slotType == 0)then {_ret = 8000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 40000;};   //average joe's
   if (_slotType == 2)then {_ret = 80000;};  //high roller's
};
         
if (_idxA == 3 && _idxB == 3 && _idxC == 3)then//                      (GRAPS , GRAPS , GRAPS)
{
   if (_slotType == 0)then {_ret = 6000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 30000;};   //average joe's
   if (_slotType == 2)then {_ret = 60000;};  //high roller's
};
         
if (_idxA == 2 && _idxB == 2 && _idxC == 2)then//                      (PLUMS , PLUMS , PLUMS)
{
   if (_slotType == 0)then {_ret = 5000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 25000;};   //average joe's
   if (_slotType == 2)then {_ret = 50000;};  //high roller's
};
         
if (_idxA == 1 && _idxB == 1 && _idxC == 1)then//                      (CHERRY , CHERRY , CHERRY)
{
   if (_slotType == 0)then {_ret = 4000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 20000;};   //average joe's
   if (_slotType == 2)then {_ret = 40000;};  //high roller's
};

if (_idxA == 0 && _idxB == 0 && _idxC == 0)then//                      (LEAF , LEAF , LEAF)
{
   if (_slotType == 0)then {_ret = 2000;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 10000;};   //average joe's
   if (_slotType == 2)then {_ret = 20000;};  //high roller's
};

if ((_idxA == 8 && _idxB == 8 && _idxC != 8) || (_idxA == 8 && _idxB != 8 && _idxC == 8) || (_idxA != 8 && _idxB == 8 && _idxC == 8))then // 2 Bars + Any     
{
   if (_slotType == 0)then {_ret = 1600;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 8000;};   //average joe's
   if (_slotType == 2)then {_ret = 16000;};  //high roller's
};

if ((_idxA == 7 && _idxB == 7 && _idxC != 7) || (_idxA == 7 && _idxB != 7 && _idxC == 7) || (_idxA != 7 && _idxB == 7 && _idxC == 7))then // 2 Sevens + Any     
{
   if (_slotType == 0)then {_ret = 800;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 4000;};   //average joe's
   if (_slotType == 2)then {_ret = 8000;};  //high roller's
};

if ((_idxA == 6 && _idxB == 6 && _idxC != 6) || (_idxA == 6 && _idxB != 6 && _idxC == 6) || (_idxA != 6 && _idxB == 6 && _idxC == 6))then // 2 Sevens + Any     
{
   if (_slotType == 0)then {_ret = 400;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 2000;};   //average joe's
   if (_slotType == 2)then {_ret = 4000;};  //high roller's
};

if ((_idxA == 5 && _idxB == 5 && _idxC != 5) || (_idxA == 5 && _idxB != 5 && _idxC == 5) || (_idxA != 5 && _idxB == 5 && _idxC == 5))then // 2 Sevens + Any     
{
   if (_slotType == 0)then {_ret = 150;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 750;};   //average joe's
   if (_slotType == 2)then {_ret = 1500;};  //high roller's
};

if ((_idxA == 4 && _idxB == 4 && _idxC != 4) || (_idxA == 4 && _idxB != 4 && _idxC == 4) || (_idxA != 4 && _idxB == 4 && _idxC == 4))then // 2 Sevens + Any     
{
   if (_slotType == 0)then {_ret = 140;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 700;};   //average joe's
   if (_slotType == 2)then {_ret = 1400;};  //high roller's
};

if ((_idxA == 3 && _idxB == 3 && _idxC != 3) || (_idxA == 3 && _idxB != 3 && _idxC == 3) || (_idxA != 3 && _idxB == 3 && _idxC == 3))then // 2 Bells + Any     
{
   if (_slotType == 0)then {_ret = 130;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 650;};   //average joe's
   if (_slotType == 2)then {_ret = 1300;};  //high roller's
};

if ((_idxA == 2 && _idxB == 2 && _idxC != 2) || (_idxA == 2 && _idxB != 2 && _idxC == 2) || (_idxA != 2 && _idxB == 2 && _idxC == 2))then // 2 Grapes + Any     
{
   if (_slotType == 0)then {_ret = 120;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 600;};   //average joe's
   if (_slotType == 2)then {_ret = 1200;};  //high roller's
};

if ((_idxA == 1 && _idxB == 1 && _idxC != 1) || (_idxA == 1 && _idxB != 1 && _idxC == 1) || (_idxA != 1 && _idxB == 1 && _idxC == 1))then // 2 Plums + Any     
{
   if (_slotType == 0)then {_ret = 110;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 550;};   //average joe's
   if (_slotType == 2)then {_ret = 1100;};  //high roller's
};

if ((_idxA == 0 && _idxB == 0 && _idxC != 0) || (_idxA == 0 && _idxB != 0 && _idxC == 0) || (_idxA != 0 && _idxB == 0 && _idxC == 0))then // 2 Cherrys + Any     
{
   if (_slotType == 0)then {_ret = 100;};   //penny snatcher's
   if (_slotType == 1)then {_ret = 500;};   //average joe's
   if (_slotType == 2)then {_ret = 1000;};  //high roller's
};

_ret;
