clear, clc

% music_t
load('�Ӹ������ļ�.mat');
% music_b
load('�ӵ������ļ�.mat');

% ������
t = music_t(1:4,:); % ����������
tdur = music_t(5,:); % ��������������ʱ��
tpow = music_t(6:9,:); % ������������Ӧ������
t_flag = music_t(10,:); % �ж��Ƿ�Ϊ�����ı�־

% ������
b = music_b(1:4,:);
bdur = music_b(5,:);
bpow = music_b(6:9,:);
b_flag = music_b(10,:);

% �ٶ����ӣ����������������ʣ�ֵԽ�ߣ������ٶ�Խ��
% speed_factor = 3.3;
speed_factor = 4.95

%���ڼ���������͵������Ƿ�ʱ��һ��
sum_b = sum(bdur);
sum_t = sum(tdur);

%���ò��ź���
play_clock(t, tdur, b, bdur, tpow, bpow, t_flag, b_flag, speed_factor);
