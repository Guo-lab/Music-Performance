fs = 44100; % sample rate
dt = 1/fs;

T16 = 0.25;

t16 = [0:dt:T16];
[temp k] = size(t16);

t8=linspace(0,2*T16,2*k);
t8fd=linspace(0,3*T16,3*k);
t4=linspace(0,4*T16,4*k);
t4fd=linspace(0,5*T16,5*k);
t2fd=linspace(0,7*T16,7*k);
t2=linspace(0,6*T16,6*k);


[temp i] = size(t4);
[temp j] = size(t8);

% Modification functions
mod2 = sin(pi*t2/t2(end));
mod2fd=sin(pi*t2fd/t2fd(end));
mod4 = sin(pi*t4/t4(end));
mod4fd=sin(pi*t4fd/t4fd(end));
mod8 = sin(pi*t8/t8(end));
mod8fd=sin(pi*t8fd/t8fd(end));
mod16 = sin(pi*t16/t16(end));

f0 = 2*146.8; % reference frequency

ScaleTable = 3*[2/3 3/4 5/6 15/16 ...
1 9/8 5/4 4/3 3/2 5/3 9/5 15/8 ...
2 9/4 5/2 8/3 3 10/3 15/4 4 ...
1/2 9/16 5/8]/((2^(1/12)))^5;

% half note
do1h = mod2.*cos(2*pi*ScaleTable(5)*f0*t2);

% dotted minim
so1hfd = mod2fd.*cos(2*pi*ScaleTable(9)*f0*t2fd);

% quarter note
do0f = mod4.*cos(2*pi*ScaleTable(21)*f0*t4);
re0f = mod4.*cos(2*pi*ScaleTable(22)*f0*t4);
mi0f = mod4.*cos(2*pi*ScaleTable(23)*f0*t4);

fa0f = mod4.*cos(2*pi*ScaleTable(1)*f0*t4);
so0f = mod4.*cos(2*pi*ScaleTable(2)*f0*t4);
la0f = mod4.*cos(2*pi*ScaleTable(3)*f0*t4);
ti0f = mod4.*cos(2*pi*ScaleTable(4)*f0*t4);
do1f = mod4.*cos(2*pi*ScaleTable(5)*f0*t4);
re1f = mod4.*cos(2*pi*ScaleTable(6)*f0*t4);
mi1f = mod4.*cos(2*pi*ScaleTable(7)*f0*t4);
fa1f = mod4.*cos(2*pi*ScaleTable(8)*f0*t4);
so1f = mod4.*cos(2*pi*ScaleTable(9)*f0*t4);
la1f = mod4.*cos(2*pi*ScaleTable(10)*f0*t4);
tb1f = mod4.*cos(2*pi*ScaleTable(11)*f0*t4);
ti1f = mod4.*cos(2*pi*ScaleTable(12)*f0*t4);
do2f = mod4.*cos(2*pi*ScaleTable(13)*f0*t4);
re2f = mod4.*cos(2*pi*ScaleTable(14)*f0*t4);
mi2f = mod4.*cos(2*pi*ScaleTable(15)*f0*t4);
fa2f = mod4.*cos(2*pi*ScaleTable(16)*f0*t4);
so2f = mod4.*cos(2*pi*ScaleTable(17)*f0*t4);
la2f = mod4.*cos(2*pi*ScaleTable(18)*f0*t4);
ti2f = mod4.*cos(2*pi*ScaleTable(19)*f0*t4);
do3f = mod4.*cos(2*pi*ScaleTable(20)*f0*t4);
blkf = zeros(1,i);

% dotted quarter note
do0ffd = mod4fd.*cos(2*pi*ScaleTable(21)*f0*t4fd);
re0ffd = mod4fd.*cos(2*pi*ScaleTable(22)*f0*t4fd);
mi0ffd = mod4fd.*cos(2*pi*ScaleTable(23)*f0*t4fd);

fa0ffd = mod4fd.*cos(2*pi*ScaleTable(1)*f0*t4fd);
so0ffd = mod4fd.*cos(2*pi*ScaleTable(2)*f0*t4fd);
la0ffd = mod4fd.*cos(2*pi*ScaleTable(3)*f0*t4fd);
ti0ffd = mod4fd.*cos(2*pi*ScaleTable(4)*f0*t4fd);
do1ffd = mod4fd.*cos(2*pi*ScaleTable(5)*f0*t4fd);
re1ffd = mod4fd.*cos(2*pi*ScaleTable(6)*f0*t4fd);
mi1ffd = mod4fd.*cos(2*pi*ScaleTable(7)*f0*t4fd);
fa1ffd = mod4fd.*cos(2*pi*ScaleTable(8)*f0*t4fd);
so1ffd = mod4fd.*cos(2*pi*ScaleTable(9)*f0*t4fd);
la1ffd = mod4fd.*cos(2*pi*ScaleTable(10)*f0*t4fd);
tb1ffd = mod4fd.*cos(2*pi*ScaleTable(11)*f0*t4fd);
ti1ffd = mod4fd.*cos(2*pi*ScaleTable(12)*f0*t4fd);
do2ffd = mod4fd.*cos(2*pi*ScaleTable(13)*f0*t4fd);
re2ffd = mod4fd.*cos(2*pi*ScaleTable(14)*f0*t4fd);
mi2ffd = mod4fd.*cos(2*pi*ScaleTable(15)*f0*t4fd);
fa2fdf = mod4fd.*cos(2*pi*ScaleTable(16)*f0*t4fd);
so2fdf = mod4fd.*cos(2*pi*ScaleTable(17)*f0*t4fd);
la2fdf = mod4fd.*cos(2*pi*ScaleTable(18)*f0*t4fd);
ti2fdf = mod4fd.*cos(2*pi*ScaleTable(19)*f0*t4fd);
do3fdf = mod4fd.*cos(2*pi*ScaleTable(20)*f0*t4fd);

% eighth note
fa0e = mod8.*cos(2*pi*ScaleTable(1)*f0*t8);
so0e = mod8.*cos(2*pi*ScaleTable(2)*f0*t8);
la0e = mod8.*cos(2*pi*ScaleTable(3)*f0*t8);
ti0e = mod8.*cos(2*pi*ScaleTable(4)*f0*t8);
do1e = mod8.*cos(2*pi*ScaleTable(5)*f0*t8);
re1e = mod8.*cos(2*pi*ScaleTable(6)*f0*t8);
mi1e = mod8.*cos(2*pi*ScaleTable(7)*f0*t8);
fa1e = mod8.*cos(2*pi*ScaleTable(8)*f0*t8);
so1e = mod8.*cos(2*pi*ScaleTable(9)*f0*t8);
la1e = mod8.*cos(2*pi*ScaleTable(10)*f0*t8);
tb1e = mod8.*cos(2*pi*ScaleTable(11)*f0*t8);
ti1e = mod8.*cos(2*pi*ScaleTable(12)*f0*t8);
do2e = mod8.*cos(2*pi*ScaleTable(13)*f0*t8);
re2e = mod8.*cos(2*pi*ScaleTable(14)*f0*t8);
mi2e = mod8.*cos(2*pi*ScaleTable(15)*f0*t8);
fa2e = mod8.*cos(2*pi*ScaleTable(16)*f0*t8);
so2e = mod8.*cos(2*pi*ScaleTable(17)*f0*t8);
la2e = mod8.*cos(2*pi*ScaleTable(18)*f0*t8);
ti2e = mod8.*cos(2*pi*ScaleTable(19)*f0*t8);
do3e = mod8.*cos(2*pi*ScaleTable(20)*f0*t8);
blke = zeros(1,j);

% dotted eighth note
do0efd = mod8fd.*cos(2*pi*ScaleTable(21)*f0*t8fd);
re0efd = mod8fd.*cos(2*pi*ScaleTable(22)*f0*t8fd);
mi0efd = mod8fd.*cos(2*pi*ScaleTable(23)*f0*t8fd);

fa0efd = mod8fd.*cos(2*pi*ScaleTable(1)*f0*t8fd);
so0efd = mod8fd.*cos(2*pi*ScaleTable(2)*f0*t8fd);
la0efd = mod8fd.*cos(2*pi*ScaleTable(3)*f0*t8fd);
ti0efd = mod8fd.*cos(2*pi*ScaleTable(4)*f0*t8fd);
do1efd = mod8fd.*cos(2*pi*ScaleTable(5)*f0*t8fd);
re1efd = mod8fd.*cos(2*pi*ScaleTable(6)*f0*t8fd);
mi1efd = mod8fd.*cos(2*pi*ScaleTable(7)*f0*t8fd);
fa1efd = mod8fd.*cos(2*pi*ScaleTable(8)*f0*t8fd);
so1efd = mod8fd.*cos(2*pi*ScaleTable(9)*f0*t8fd);
la1efd = mod8fd.*cos(2*pi*ScaleTable(10)*f0*t8fd);
tb1efd = mod8fd.*cos(2*pi*ScaleTable(11)*f0*t8fd);
ti1efd = mod8fd.*cos(2*pi*ScaleTable(12)*f0*t8fd);
do2efd = mod8fd.*cos(2*pi*ScaleTable(13)*f0*t8fd);
re2efd = mod8fd.*cos(2*pi*ScaleTable(14)*f0*t8fd);
mi2efd = mod8fd.*cos(2*pi*ScaleTable(15)*f0*t8fd);
fa2edf = mod8fd.*cos(2*pi*ScaleTable(16)*f0*t8fd);
so2edf = mod8fd.*cos(2*pi*ScaleTable(17)*f0*t8fd);
la2edf = mod8fd.*cos(2*pi*ScaleTable(18)*f0*t8fd);
ti2edf = mod8fd.*cos(2*pi*ScaleTable(19)*f0*t8fd);
do3edf = mod8fd.*cos(2*pi*ScaleTable(20)*f0*t8fd);

% sixteenth note
fa0s = mod16.*cos(2*pi*ScaleTable(1)*f0*t16);
so0s = mod16.*cos(2*pi*ScaleTable(2)*f0*t16);
la0s = mod16.*cos(2*pi*ScaleTable(3)*f0*t16);
ti0s = mod16.*cos(2*pi*ScaleTable(4)*f0*t16);
do1s = mod16.*cos(2*pi*ScaleTable(5)*f0*t16);
re1s = mod16.*cos(2*pi*ScaleTable(6)*f0*t16);
mi1s = mod16.*cos(2*pi*ScaleTable(7)*f0*t16);
fa1s = mod16.*cos(2*pi*ScaleTable(8)*f0*t16);
so1s = mod16.*cos(2*pi*ScaleTable(9)*f0*t16);
la1s = mod16.*cos(2*pi*ScaleTable(10)*f0*t16);
tb1s = mod16.*cos(2*pi*ScaleTable(11)*f0*t16);
ti1s = mod16.*cos(2*pi*ScaleTable(12)*f0*t16);
do2s = mod16.*cos(2*pi*ScaleTable(13)*f0*t16);
re2s = mod16.*cos(2*pi*ScaleTable(14)*f0*t16);
mi2s = mod16.*cos(2*pi*ScaleTable(15)*f0*t16);
fa2s = mod16.*cos(2*pi*ScaleTable(16)*f0*t16);
so2s = mod16.*cos(2*pi*ScaleTable(17)*f0*t16);
la2s = mod16.*cos(2*pi*ScaleTable(18)*f0*t16);
ti2s = mod16.*cos(2*pi*ScaleTable(19)*f0*t16);
do3s = mod16.*cos(2*pi*ScaleTable(20)*f0*t16);
blks = zeros(1,k);

melody=[re1s do1s la0s...
do1e do1s la0s do1e do1s la0s do1s la0s so0efd re1s do1s la0s...
do1e do1s la0s do1e do1s mi1s re1s do1s do1efd so0s la0s mi1s...
mi1e mi1s re1s mi1e mi1s re1s mi1s so1s mi1s mi1s blks mi1s mi1s mi1s...
re1s re1s re1s re1s re1e do1s mi1e re1efd re1s do1s la0s...
do1e do1s la0s do1e do1s la0s do1s la0s so0efd so0s la0s mi1s...
so1e so1s mi1s so1e so1s mi1s re1s do1s do1efd re1s do1s re1s...
mi1s re1s re1s do1s re1e do1s la0s re1s do1s do1s la0s do1e do1s do1ffd...
so1s so1s mi1s...
re1s mi1s la0e re1s mi1s so1s mi1s re1efd so1s so1s mi1s...
re1s mi1s so0e re1s mi1s so1s re1s do1efd do1s re1s mi1s...
so1s la1s so1s mi1s so1s mi1s mi1s re1s re1efd do1s re1s do1s...
do1s re1s do1s re1e mi1e so1s mi1s mi1efd so1s so1s mi1s...
re1s mi1s la0e re1s mi1s so1s mi1s re1efd so1s so1s mi1s...
re1s mi1s so0e re1s mi1s so1s re1s do1efd do1s re1s mi1s...
so1s la1s so1s mi1s so1s mi1s mi1s re1s re1efd so0s mi1e re1s...
re1e do1h...
mi1s so1s...
la1ffd so1s mi1s re1ffd do1s re1s...
so1ffd so1s re1s do1ffd do1s re1s...
mi1e re1e do1e la0e do1e re1e mi1e la1e...
so1hfd blks re1s do1s la0s...
do1e do1s la0s do1e do1s la0s do1s la0s so0efd re1s do1s la0s...
do1e do1s la0s do1e do1s mi1s re1s do1s do1efd so0s la0s mi1s...
mi1e mi1s re1s mi1e mi1s re1s mi1s so1s mi1s mi1s blks mi1s mi1s mi1s...
re1s re1s re1s re1s re1e do1s mi1e re1efd re1s do1s la0s...
do1e do1s la0s do1e do1s la0s do1s la0s so0efd so0s la0s mi1s...
so1e so1s mi1s so1e so1s mi1s re1s do1s do1efd re1s do1s re1s...
mi1s re1s re1s do1s re1e do1s la0s re1s do1s do1s la0s do1e do1s do1ffd...
so1s so1s mi1s...
re1s mi1s la0e re1s mi1s so1s mi1s re1efd so1s so1s mi1s...
re1s mi1s so0e re1s mi1s so1s re1s do1efd do1s re1s mi1s...
so1s la1s so1s mi1s so1s mi1s mi1s re1s re1efd do1s re1s do1s...
do1s re1s do1s re1e mi1e so1s mi1s mi1efd so1s so1s mi1s...
re1s mi1s la0e re1s mi1s so1s mi1s re1efd so1s so1s mi1s...
re1s mi1s so0e re1s mi1s so1s re1s do1efd do1s re1s mi1s...
so1s la1s so1s mi1s so1s mi1s mi1s re1s re1efd so0s mi1efd re1s...
re1e do1ffd...
];


s=melody;
s=s/max(s);

sound(s,fs);