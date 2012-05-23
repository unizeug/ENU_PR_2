clear
%% 100000-facher Wurf mit einem Würfel
x = floor(rand(100000,1000)*(6-1E-99)+1);
% x ist ein Vektor der Dimension 100000x1.
% Jedes Element von x steht für das Ergebis eines Würfelwurfs.

%% Berechnung des Histogramms 
[H,bins] = hist(sum(x'),60);
% bins ... Mittelwert des jeweiligen Bins
% H ... Anzahl der Treffer je Bin

%% Bestimmung der Verteilungsdichtefunktion (pdf) aus dem Histogramm


%% Darstellung der pdf
figure(1);
clf();
bar(bins,H/100000);
hold on;
title('pdf des Würfelexperiments');
xlabel('Gesamtaugenzahl');
ylabel('Häufigkeit');



% Normieren der einzelnen Werte
H1=H/length(H);
 

% Mittelwert und Varianz und Standardabweichung berechnen
m = mean(bins.*H1)/mean(H1);
v = var(bins,H1);
s = std(bins,H1);


% Gauß-Verteilung mit Mittwelwert und Varianz von R zum Überlagern
gauss = (1/(s*sqrt(2*pi)))*exp(-(1/2).*((bins-m)./s).^2);

% Plotten
plot(bins, gauss, 'r')


% Laplace Verteilung
%laplace = (1/(2*s))*exp(-((abs(bins-m))/s));

% Plotten
%plot(bins, laplace, 'g')



hold off;