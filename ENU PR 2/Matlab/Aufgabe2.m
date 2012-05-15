clear;
%% SNR-Berechnung am rauschbehafteten Übertragungskanal
% Laden der Messdaten
% B...Originalsignals
% A...Empfangssignals
load('Signale0.mat');

%% Berechnung des Korrekturfaktors
% das Verhältniss zwischen dem Originalsignal und dem, das durch den Kanal
% gelaufen ist

alpha = mean(B)/mean(A);


%% Korrektur der Kanaldämpfung
% den Mittelwert des Kanalsignals wieder auf den Originalmittelwert heben.
% Das Differenzsignal ist hiernach um 0 Zentriert, was das Ziel war.

A = alpha * A;


%% Berechnung des Differenzsignals
% R...Rauschsignal

R = B - A;


%% Messung des Rauschens
%snr0 = SNR(A,R);

% Signal to Noise Ratio
T=SNR(A,R);

t= 1:1:length(A);
figure(1);
plot(R)
ylim([-12 12]);
xlabel('Zeit')
ylabel('Rauschanteil [V]')


%% Berechnung des Rausch-Histogramms 
[H,bins] = hist(R,100);
% bins ... Mittelwert des jeweiligen Bins
% H ... Anzahl der Treffer je Bin


%% Bestimmung der Verteilungsdichtefunktion (pdf) aus dem Histogramm

%% Darstellung der pdf
figure(2);
clf();
bar(bins,H/length(A));
hold on;

title('pdf des Rauschens')
xlabel('Rauschverteilung [V]')
ylabel('Rauschanteil')


% Normieren der einzelnen Werte
H1=H/length(H);
 

% Mittelwert und Varianz und Standardabweichung berechnen
m = mean(bins.*H1);
v = var(bins,H);
s = std(bins,H);


% Gauß-Verteilung mit Mittwelwert und Varianz von R zum Überlagern
g = (1/(s*sqrt(2*pi)))*exp(-(1/2).*((bins-m)./s).^2);

% Normieren
gauss = g/sum(g);
plot(bins, gauss, 'r')


% Laplace Verteilung
l = (1/(2*s))*exp(-((abs(bins-m))/s));

% Normieren
laplace = l/sum(l);
plot(bins, laplace, 'g')



hold off;

