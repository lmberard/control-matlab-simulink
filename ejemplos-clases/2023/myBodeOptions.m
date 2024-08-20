function options = myBodeOptions()
% set(findall(gcf,'type','line'),'LineWidth',2.0); % Agregar esto al 
                                                   % script es para acomodar el LineWidth

options = bodeoptions;
options.FreqUnits = 'Hz'; % or 'rad/second', 'rpm', etc.
options.PhaseMatching='on';
options.PhaseMatchingFreq=10;
options.PhaseMatchingFreq=0;
options.Grid='on';


