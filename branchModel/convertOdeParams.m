function params = convertOdeParams(paramVec)
% ParamVec = [bm3; bm4;  a2;  b21;   a3;  b32; br34;   a4;  b41; br43;   a5;   b53;  b54] % 

    paramVec = paramVec(:);

    bm3 = paramVec(1);
    bm4 = paramVec(2);
    
    params.S = [ 1 -1  0 -1  0   ;
                 0  1 -1  0  0   ;
                 0  0  1  0 -bm3 ;
                 0  0  0  1 -bm4 ;
                 0  0  0  0  1   ];

    params.v0 = 1;
    
	params.a2   = paramVec(3);
	params.b21  = paramVec(4);
	params.a3   = paramVec(5);
	params.b32  = paramVec(6);
	params.br34 = paramVec(7);
	params.a4   = paramVec(8);
	params.b41  = paramVec(9);
	params.br43 = paramVec(10);
	params.a5   = paramVec(11);
	params.b53  = paramVec(12);
	params.b54  = paramVec(13);
        
end
