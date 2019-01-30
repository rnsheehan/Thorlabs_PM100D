function v = PM100D_Read_Power_Average(visObj, Nreads)
% Take an average of multiple readings from the PM100D
% Nreads = 11 is usually enough
% return array of the form [PmW, delta PmW, PdBm, delta PdBm]
% R. Sheehan 30 - 1 - 2019

if Nreads > 3 && Nreads < 51
    % take an average of the readings
    mWvals = zeros(Nreads, 1); dBmvals = zeros(Nreads, 1); 
    for i = 1:Nreads
        power = PM100D_Read_Power(visObj); 
        mWvals(i) = power(2); dBmvals(i) = power(3); 
    end
    
    meanmW = mean(mWvals); spreadmW = max(mWvals) - min(mWvals); 
    meandBm = mean(dBmvals); spreaddBm = max(dBmvals) - min(dBmvals); 
    
    v = [meanmW, spreadmW, meandBm, spreaddBm]; 
else
    % take a single reading
    power = PM100D_Read_Power(visObj); 
    
    v = [power(2), 0.0, power(3), 0.0]; 
end

end