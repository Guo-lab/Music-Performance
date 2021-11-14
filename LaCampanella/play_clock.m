% Usage : Copy_of_play_clock(treble,treble_duration,bass,bass_duration,treble_power,bass_power,t_flag,b_flag,speed_factor)
%
% treble -> 高音音符
% treble_duration -> 高音音符持续时间
% bass -> 低音音符
% bass_duration -> 低音音符持续时间
% treble_power -> 高音音符力度
% t_flag -> 判断是否为顿音
% bass_power -> 低音音符力度
% b_flag -> 判断是否为顿音

function play_clock(treble, treble_duration, bass, bass_duration, treble_power, bass_power, t_flag, b_flag, speed_factor)
    
    % fs = 48000;
    fs = 48000; 
    
    % 调用相关文件
    % 'piano_data1'
    load('钢琴88键延音.mat');
    % 'piano_data2'
    load('钢琴88键顿音.mat');
    % keys
    load('键位.mat');
    % white
    load('白键.mat');
    
    % 高音区处理，合成高音区音频
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
    
    
    % 低音区处理,合成低音区音频
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
    
    
    % 合成音频并播放
    % 合成高音区和低音区的离散值序列，
    music_vector = treble_vector + bass_vector;           
    sound(music_vector, fs, 24);
    
    
    
    
