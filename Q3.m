clear
close all
clc

load("problem3.mat")
N = length(u);
t = h*(0:N-1);
ttrain = t(1:length(t)/2);
ttest = t(length(t)/2+1:length(t));

y(314) = y(313)+y(315)/2;
y(628) = y(627)+y(629)/2;
y(942) = y(941)+y(943)/2;

figure
subplot(2,1,1)
plot(u)
subplot(2,1,2)
plot(y)



ytrain = y(1:N/2);
utrain = u(1:N/2);
ytest = y(N/2+1:end);
utest = u(N/2+1:end);
ztrain = iddata(ytrain,utrain,h);
ztest = iddata(ytest,utest,h);


maxsig = max(abs(y))-mean(y);
dev = maxsig/std(y)

maxsig = max(abs(u))-mean(u);
dev = maxsig/std(u)
% no significant outliers seen

figure
pwelch(u)

figure
pwelch(y)
%mostly low freq => higher uncertainty for high freq!

%% arx

NN = struc(1:10,1:10,1);
V = arxstruc(ztrain,ztest,NN);%
Nbest = selstruc(V,'mdl');
arxbest = arx(ztrain,Nbest);

ypred_arx = sim(arxbest,utest);


figure
compare(ztest,arxbest,inf)
% not great, many params

figure
bode(arxbest)
% very high gain at high freq :/


figure
resid(ztest,arxbest)
%ok-ish


%% oe
oebest = oe(ztrain,[4,4,1]);

figure
compare(ztest,oebest,inf)
%pretty good


figure
bode(oebest)
%better!

figure
resid(ztest,oebest)


present(oebest)

[eobl,sig] = balreal(oebest);
figure
plot(sig)


