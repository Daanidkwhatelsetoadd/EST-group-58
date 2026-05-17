% Pre-processing script for the EST Simulink model. This script is invoked
% before the Simulink model starts running (initFcn callback function).

%% Load the supply and demand data

timeUnit   = 's';

supplyFile = "Team58_supply (1).csv";
supplyUnit = "kW";

% load the supply data
Supply = loadSupplyData(supplyFile, timeUnit, supplyUnit);

demandFile = "Team58_demand.csv";
demandUnit = "kW";

% load the demand data
Demand = loadDemandData(demandFile, timeUnit, demandUnit);

%% Simulation settings

deltat = 5*unit("min");
stopt  = min([Supply.Timeinfo.End, Demand.Timeinfo.End]);

%% System parameters

% transport from supply
aSupplyTransport = 0.00; % Dissipation coefficient
LDratioSupply = 136.1;% ratio of the length over the diameter of the pipes to the supply
AreaSupply = 6.79;% area of the pip to the supply
heightDifference = 300;% height difference between the reservoirs
pipeRoughnessSupply = 0.0001; %coefficient for the pipe roughness
PipeLengthSupply = 400;% length of the pipes to the supply





% injection system
aInjection = 0.0; % Dissipation coefficient

% storage system
EStorageMax     = 361000000*unit("kWh"); % Maximum energy
EStorageMin     = 0.0*unit("kWh"); % Minimum energy
EStorageInitial = 0.0*unit("kWh"); % Initial energy
bStorage        = 0/unit("s");  % Storage dissipation coefficient

% extraction system
aExtraction = 0; % Dissipation coefficient

% transport to demand
aDemandTransport = 0.; % Dissipation coefficient