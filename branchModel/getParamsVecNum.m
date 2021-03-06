function vecOut = getParamsVecNum(n)
% Just a hard-coded list of parameter vectors, by index

    % Vary ICs
        %  Params  = [bm3; bm4;    a2; b21;     a3;  b32; br34;     a4;  b41;  br43;     a5;  b53;  b54;   x0_1; x0_2; x0_3; x0_4; x0_5;];
    paramsList{1}  = [0.6; 0.4;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    0.1;  0.2;  0.3;  0.4;  0.5;];
    paramsList{2}  = [0.6; 0.4;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    0.1;  0.1;  0.1;  0.1;  0.1;];
    paramsList{3}  = [0.6; 0.4;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];
    
    % Vary Parameters
        %  Params  = [bm3; bm4;    a2; b21;     a3;  b32; br34;     a4;  b41;  br43;     a5;  b53;  b54;   x0_1; x0_2; x0_3; x0_4; x0_5;];
    paramsList{4}  = [0.6; 0.4;  0.22; .925;  .691; .856; .302;   .416; .107; -.564;   .436; .816; .520;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{5}  = [0.6; 0.4;  .935; .457;  .240; .763; .759;   .740; .743; -.106;   .681; .463; .212;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{6}  = [0.6; 0.4;  0.52; .725;  .791; .656; .402;   .816; .807; -.364;   .936; .616; .820;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{7}  = [0.6; 0.4;  .679; .036;  .809; .748; .120;   .525; .325; -.546;   .398; .415; .180;    1.0;  1.0;  1.0;  1.0;  1.0;];
    
    % Vary biomass composition
        %  Params  = [bm3; bm4;    a2; b21;     a3;  b32; br34;     a4;  b41;  br43;     a5;  b53;  b54;   x0_1; x0_2; x0_3; x0_4; x0_5;];
    paramsList{8}  = [0.9; 0.1;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{9}  = [0.8; 0.2;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{10} = [0.7; 0.3;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{11} = [0.5; 0.5;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{12} = [0.4; 0.6;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{13} = [0.3; 0.7;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{14} = [0.2; 0.8;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];
    paramsList{15} = [0.1; 0.9;   0.8;  0.5;     1; 0.75;  0.2;    0.5;  0.4; -0.80;    0.5;  0.5;  0.8;    1.0;  1.0;  1.0;  1.0;  1.0;];

    vecOut = paramsList{n};

end


