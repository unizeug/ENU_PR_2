%% 100000-facher Wurf mit einem Würfel
x = floor(rand(100000,1)*(6-1E-99)+1);
% x ist ein Vektor der Dimension 100000x1.
% Jedes Element von x steht für das Ergebis eines Würfelwurfs.

%% Berechnung des Histogramms 
[H,bins] = hist(x,100);
% bins ... Mittelwert des jeweiligen Bins
% H ... Anzahl der Treffer je Bin

%% Bestimmung der Verteilungsdichtefunktion (pdf) aus dem Histogramm

%
% ZU VERVOLLSTÄNDIGEN
%

%% Darstellung der pdf
figure(1);
title('pdf des Würfelexperiments')
xlabel('Augenzahl')
bar(bins,H/100000);