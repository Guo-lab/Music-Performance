% Usage : Copy_of_play_clock(treble,treble_duration,bass,bass_duration,treble_power,bass_power,t_flag,b_flag,speed_factor)
%
% treble -> ��������
% treble_duration -> ������������ʱ��
% bass -> ��������
% bass_duration -> ������������ʱ��
% treble_power -> ������������
% t_flag -> �ж��Ƿ�Ϊ����
% bass_power -> ������������
% b_flag -> �ж��Ƿ�Ϊ����

function play_clock(treble, treble_duration, bass, bass_duration, treble_power, bass_power, t_flag, b_flag, speed_factor)
    
    % fs = 48000;
    fs = 48000; 
    
    % ��������ļ�
    % 'piano_data1'
    load('����88������.mat');
    % 'piano_data2'
    load('����88������.mat');
    % keys
    load('��λ.mat');
    % white
    load('�׼�.mat');
    
    % �����������ϳɸ�������Ƶ
    aa = size(treble, 1);
    bb = size(treble, 2);
    
    % treble vector generator
    treble_vector = zeros(1,floor(sum(treble_duration)*fs/speed_factor)+ 1 + 480000);  
    n1 = 1;
    for kk = 1 : bb
        % duration generator
        tt = (1/fs) : (1/fs) : (treble_duration(kk)/speed_factor);  
        tone = zeros(1, length(piano_data1(1, :)) );
        for ll = 1 : aa
            keynum = treble(ll, kk);
            if (keynum == 0)
                if(ll==1)
                    tone = 0;
                end
                break;
            elseif(t_flag == 1)
                tone = tone + piano_data1(keynum, :) * treble_power(ll, kk)/10;      
            else
                tone = tone + [piano_data2(keynum, :) * treble_power(ll, kk), zeros(1, 180000)]/10;
            end
        end
        n2 = n1 + length(tone) - 1;
        treble_vector(n1:n2) = treble_vector(n1:n2) + tone;
        n1 = n2 - length(tone) + length(tt);
    end
    
    
    % ����������,�ϳɵ�������Ƶ
    aa = size(bass, 1);
    bb = size(bass, 2);
    bass_vector = zeros(1,floor(sum(bass_duration)*fs/speed_factor) + 1 + 480000);           % bass vector generator
    n1 = 1;
    for kk = 1:bb
        tt = (1/fs) : (1/fs) : (bass_duration(kk)/speed_factor); 
        tone = zeros(1,length(piano_data1(1, :)) );
        for ll = 1:aa
            keynum = bass(ll, kk);
            if (keynum == 0)
                if(ll==1)
                    tone = 0;
                end
                break;
            elseif(b_flag == 1)
                tone = tone+piano_data1(keynum, :) * bass_power(ll, kk)/10;
            else
                tone = tone+[piano_data2(keynum, :) * bass_power(ll, kk),zeros(1, 180000)]/10;
            end
        end
        n2 = n1 + length(tone) - 1;
        bass_vector(n1:n2) = bass_vector(n1:n2) + tone;
        n1 = n2-length(tone) + length(tt);
    end
    
    
    % �ϳ���Ƶ������
    % �ϳɸ������͵���������ɢֵ���У�
    music_vector = treble_vector + bass_vector;           
    sound(music_vector, fs, 24);
    
    
    
    
