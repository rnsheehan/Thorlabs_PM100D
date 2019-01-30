function v = PM100D_Read_Power(visObj)
% Read the current power level on the PM100D
% Output is of the form [Watt, milli-Watt, dBm]

addpath(genpath('c:/Users/Robert/Programming/MATLAB/Common/'))

PW = str2double (query (visObj, 'Meas?\n')); 
PmW = 1000 * PW; 
PdBm = Convert_mW_dBm(PmW); 

v = [PW, PmW, PdBm]; 

end