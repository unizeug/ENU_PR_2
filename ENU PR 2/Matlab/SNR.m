%% Funktion zur Bestimmung des SNRs
function result = SNR(U,N)
% U... Signalvektor
% N... Rauschvektor

%% Berechnung der Energien

E_U = mean(U.*U);
E_N = mean(N.*N);

%% Berechung des SNRs
% Eigentlich müssten die Energien noch durch die anzahl der Messungen
% geteilt werden un die Leistung zu erhalten, da sie aber die gleiche
% Länge haben kürzen sie sich raus und die Energien sind gleich der
% Leistungen.

result = 10*log10(E_U/E_N);
