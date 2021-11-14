clear, clc

% music_t
load('钟高音区文件.mat');
% music_b
load('钟低音区文件.mat');

% 高音区
t = music_t(1:4,:); % 高音区音符
tdur = music_t(5,:); % 高音区音符持续时间
tpow = music_t(6:9,:); % 高音区音符对应的力度
t_flag = music_t(10,:); % 判断是否为顿音的标志

% 低音区
b = music_b(1:4,:);
bdur = music_b(5,:);
bpow = music_b(6:9,:);
b_flag = music_b(10,:);

% 速度因子，用来调整播放速率，值越高，播放速度越快
% speed_factor = 3.3;
speed_factor = 4.95

%用于检验高音区和低音区是否时间一致
sum_b = sum(bdur);
sum_t = sum(tdur);

%调用播放函数
play_clock(t, tdur, b, bdur, tpow, bpow, t_flag, b_flag, speed_factor);
