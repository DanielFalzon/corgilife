waitUntil {isServer || {getClientStateNumber == 10}};

{
  //--- TerrainObjects
  {
    private _cfg = _x;
    private _rootCfg = _x;
    private _scope = getNumber (_cfg >> "scope"); // 1-server, 2-all
    private _recursive = getNumber (_cfg >> "recursive") <= 0;

    if (_scope == 2 || {_scope == 1 && {isServer}}) then {
      //--- Read position
      private _pos = getArray (_cfg >> "position");

      //--- Check for map type
      private _mapType = _cfg >> "mapType";
      _mapType = switch true do {
        case (isText _mapType): {[getText _mapType]};
        case (isArray _mapType): {getArray _mapType};
        default {[]};
      };

      //--- Read radius
      private _radius = getNumber (_cfg >> "radius");
      _radius = 1.5 max _radius;

      //--- Get nearest objects matching the criteria
      private _objects = nearestTerrainObjects [_pos, _mapType, _radius];

      if !(_objects isEqualTo []) then {
        {
          scopeName "loop";
          private _object = _x;
          private _cfg = _cfg;

          //--- Read object type
          private _type = _cfg >> "type";
          _type = switch true do {
            case (isText _type): {[getText _type]};
            case (isArray _type): {getArray _type};
            default {};
          };

          //--- Check object type and model type (if given)
          if (isNil "_type" || {{_x == typeOf _object} count _type > 0} || {{str _object find ": " + _x != -1} count _type > 0}) then {
            private _replacements = _cfg >> "Replacements";

            //--- Hide object
            if (getNumber (_cfg >> "hide") > 0 || {isClass _replacements}) then {
              if (_scope == 1) then {
                _object hideObjectGlobal true;
              } else {
                _object hideObject true;
              };

              //--- Disable simulation and damage of hidden object
              _object enableSimulation false;
              _object allowDamage false;

              if (isClass _replacements) then {
                _replacements = "getNumber (_x >> 'scope') > 0" configClasses _replacements;

                if !(_replacements isEqualTo []) then {
                  private _replacementCfg = selectRandom _replacements;
                  private _replacementType = getText (_replacementCfg >> "type");

                  //--- Create replacement (1-server/global, 2-all/local)
                  private _replacement = switch (_scope) do {
                    case 1: {
                      if (getNumber (_replacementCfg >> "simple") > 0) then {
                        createSimpleObject [_replacementType, getPosWorld _object]
                      } else {
                        createVehicle [_replacementType, getPosATL _object, [], 0, "CAN_COLLIDE"]
                      };
                    };

                    case 2: {
                      _replacementType createVehicleLocal getPosATL _object
                    };

                    default {};
                  };

                  if (isNil "_replacement") exitWith {};

                  _replacement setPosASL getPosASL _object;
                  _replacement setVectorDirAndUp [vectorDir _object, vectorUp _object];
                  _object = _replacement;
                  _cfg = _replacementCfg;
                };
              };
            };

            //--- Simulation and damage
            _object enableSimulation (getNumber (_cfg >> "enableSimulation") > 0);
            _object allowDamage (getNumber (_cfg >> "allowDamage") > 0);

            //--- Init
            private _init = getText (_cfg >> "init");
            if (_init != "") then {
              _object call compile _init;
            };

            //--- Recursive?
            if (_recursive) then {
              breakOut "loop";
            };
          };
        } forEach _objects;
      };
    };
  } forEach ("true" configClasses _x);
} forEach [
  configFile >> "CfgMap" >> "TerrainObjects",
  missionConfigFile >> "CfgMap" >> "TerrainObjects"
];

{
  //--- Objects
  {
    private _cfg = _x;
    private _scope = getNumber (_cfg >> "scope");
    private _position = getArray (_cfg >> "position");
    private _vectorDirUp = getArray (_cfg >> "vectorDirUp");

    //--- 1-server/global, 2-all/local/hasInterface
    if (_scope == 1 && {isServer} || {_scope == 2 && {hasInterface}}) then {
      private _type = getText (_cfg >> "type");

      private _object = if (_scope == 1) then {
        if (getNumber (_cfg >> "simple") > 0) then {
          createSimpleObject [_type, _position]
        } else {
          createVehicle [_type, _position, [], 0, "CAN_COLLIDE"]
        };
      } else {
        _type createVehicleLocal _position
      };

      _object setVectorDirAndUp _vectorDirUp;
      _object enableSimulation (getNumber (_cfg >> "enableSimulation") > 0);
      _object allowDamage (getNumber (_cfg >> "allowDamage") > 0);
    };

    //--- Marker
    if (isClass (_cfg >> "Marker")) then {
      private _markerScope = getNumber (_cfg >> "Marker" >> "scope");
      if (_markerScope <= 0) exitWith {}; //--- 1-global, 2-local

      private _markerName = format ["CfgMap_%1", configName _cfg];
      private _markerPos = _position;
      private _markerShape = getText (_cfg >> "Marker" >> "shape");
      private _markerType = getText (_cfg >> "Marker" >> "type");
      private _markerBrush = getText (_cfg >> "Marker" >> "brush");
      private _markerSize = getArray (_cfg >> "Marker" >> "size");
      private _markerColor = getText (_cfg >> "Marker" >> "color");
      private _markerAngle = (_vectorDirUp select 0 select 0) atan2 (_vectorDirUp select 0 select 1);

      if (_markerScope == 1) then {
        private _marker = createMarker [_markerName, _markerPos];
        _marker setMarkerShape _markerShape;
        _marker setMarkerType _markerType;
        _marker setMarkerBrush _markerBrush;
        _marker setMarkerSize _markerSize;
        _marker setMarkerColor _markerColor;
        _marker setMarkerDir _markerAngle;
      } else {
        private _marker = createMarkerLocal [_markerName, _markerPos];
        _marker setMarkerShapeLocal _markerShape;
        _marker setMarkerTypeLocal _markerType;
        _marker setMarkerBrushLocal _markerBrush;
        _marker setMarkerSizeLocal _markerSize;
        _marker setMarkerColorLocal _markerColor;
        _marker setMarkerDirLocal _markerAngle;
      };
    };
  } forEach ("true" configClasses _x);
} forEach [
  configFile >> "CfgMap" >> "CreateObjects",
  missionConfigFile >> "CfgMap" >> "CreateObjects"
];
