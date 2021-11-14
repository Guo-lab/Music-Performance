% Usage : play(treble, treble_duration, bass, bass_duration)
%
% treble -> 高音音符
% treble_duration -> 高音音符持续时间
% bass -> 低音音符
% bass_duration -> 低音音符持续时间

function perform = play(treble, treble_duration, bass, bass_duration)
    % sampling frequency, 11025 Hz on PC / Mac
    fs = 11025;
    % cpu speed compensation factor
    speed_factor = 2;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%% treble vector generator %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    treble_vector = zeros(1, sum(treble_duration) * fs + 1);
    % beginning index
    n1 = 1; 
    % for loop
    for kk = 1 : length(treble)
        keynum = treble(kk);
        
        % rest period definition
        if (keynum == 0) 
            % amplitude at 0.0
            A = 0.0;                                       
            freq = 440;
        else
            % note amplitude at 0.5
            A = 0.5;                                       
            freq = 440 * (2^((keynum-49)/12));
        end
        
        % duration generator
        tt = 0 : (1/fs) : (treble_duration(kk)/speed_factor);
        % tone generator
        tone = A * cos(2 * pi * freq * tt);                      
        % ending index 
        n2 = n1 + length(tone) - 1; 
        
        % concatenate vector
        % vector generator
        treble_vector(n1:n2) = treble_vector(n1:n2) + tone;    
        n1 = n2;                                    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%% bass vector generator %%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    bass_vector = zeros(1,sum(bass_duration)*fs+1);           
    n1 = 1;
    for kk = 1 : length(bass)
        keynum = bass(kk);
        if (keynum == 0)
            A = 0;
            freq = 440;
        else
            A = 0.5;
            freq = 440 * (2^((keynum-49)/12));
        end
        tt = 0 : (1/fs) : (bass_duration(kk)/speed_factor);
        tone = A * cos(2 * pi * freq * tt);
        n2 = n1 + length(tone) - 1;
        bass_vector(n1:n2) = bass_vector(n1:n2) + tone;
        n1 = n2;
    end
    
    % treble and bass vector combination
    music_vector = treble_vector + bass_vector;    
    
    % generator sound
    sound( music_vector, fs )                       
