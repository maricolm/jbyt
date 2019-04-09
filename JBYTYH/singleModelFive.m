function [x,vaule]=singleModelFive(C,Q,QQ,kind,a,b,c,investment)
% a=0.35,b=0.08,kind:是种类的意思，c=5200,基本增油,investment:总投资钱
C=C';
Q=Q';
QQ=QQ';
f = C-a*Q+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)];
intcon = 1:9;
if kind==1
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     [zeros(1,2),ones(1,7)];
    -[zeros(1,2),ones(1,7)];
    ];
elseif kind==2
     A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
     ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
    [ones(1,2),zeros(1,4),ones(1,3)];
    - [ones(1,2),zeros(1,4),ones(1,3)];
    ];
elseif kind==3
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
    [ones(1,6),zeros(1,2),1];
    -[ones(1,6),zeros(1,2),1];
    ];
elseif kind==4
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
    [ones(1,8),0];
    - [ones(1,8),0];
    ];
elseif kind==5
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
     [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
    [zeros(1,6),ones(1,3)];
    -[zeros(1,6),ones(1,3)];
    
    ];
elseif kind==6
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
    [zeros(1,2),ones(1,4),zeros(1,2),1];
    -[zeros(1,2),ones(1,4),zeros(1,2),1];
    ];
elseif kind==7
     A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
    [zeros(1,2),ones(1,6),0];
    - [zeros(1,2),ones(1,6),0];
    ];
elseif kind==8
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     [ones(1,2),zeros(1,6),1];
    -[ones(1,2),zeros(1,6),1];
    ]; 
elseif kind==9
     A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     [ones(1,2),zeros(1,4),ones(1,2),0];
    - [ones(1,2),zeros(1,4),ones(1,2),0];
    ];    
elseif kind==10
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     [ones(1,6),zeros(1,3)];
    - [ones(1,6),zeros(1,3)];
    ];
elseif kind==11
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     [zeros(1,8),1];
    -  [zeros(1,8),1];
    ]; 
elseif kind==12
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     [zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),0];
    ];
elseif kind==13
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     [zeros(1,2),ones(1,4),zeros(1,3)];
    -  [zeros(1,2),ones(1,4),zeros(1,3)];
    ];
elseif kind==14
     A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     [ones(1,2),zeros(1,7)];
    -  [ones(1,2),zeros(1,7)];
    ];
elseif kind==15 
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9,:)]';
    -Q'+QQ';
    ones(1,9);
    -ones(1,9);
    [zeros(1,6),ones(1,2),0];
    -[zeros(1,6),ones(1,2),0];
     zeros(1,9);
    -  zeros(1,9);
    ];
end;
bb = [investment-b*c;0;9;0;1;0;0;0];
lb = zeros(9,1);
ub = ones(9,1);
[x,favl] = intlinprog(f,intcon,A,bb,[],[],lb,ub);
vaule = -favl+(a*c-b*c);