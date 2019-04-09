function [x,vaule]=singleModel(C,Q,QQ,kind,a,b,c,investment)
C=C';
Q=Q';
QQ=QQ';
% a=0.35,b=0.08,kind:是种类的意思，c=5200,基本增油,investment:总投资钱
f = C-a*Q+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1)];
intcon = 1:8;
if kind==1
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:);zeros(3,1)]';
        -Q'+QQ';
        ones(1,8);
        -ones(1,8);
        [zeros(1,6),ones(1,2)];
        -[zeros(1,6),ones(1,2)];
          [zeros(1,2),ones(1,6)];
         -[zeros(1,2),ones(1,6)];
        ];
elseif kind==2
    A = [C'+[b*Q(1:2,:);0;0;b*Q(8,:);zeros(3,1)]';
    -Q'+QQ';
    ones(1,8);
    -ones(1,8);
    [zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2)];
     [ones(1,2),zeros(1,4),ones(1,2)];
    - [ones(1,2),zeros(1,4),ones(1,2)];
    ];
elseif kind==3
    A = [C'+[b*Q(1:2,:);0;0;b*Q(8,:);zeros(3,1)]';
    -Q'+QQ';
    ones(1,8);
    -ones(1,8);
    [zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2)];
     [ones(1,6),zeros(1,2)];
    -[ones(1,6),zeros(1,2)];
    ];
elseif kind==4
    A = [C'+[b*Q(1:2,:);0;0;b*Q(8,:);zeros(3,1)]';
    -Q'+QQ';
    ones(1,8);
    -ones(1,8);
    [zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2)];
    [zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2)];
    ];
elseif kind==5
    A = [C'+[b*Q(1:2,:);0;0;b*Q(8,:);zeros(3,1)]';
    -Q'+QQ';
    ones(1,8);
    -ones(1,8);
    [zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2)];
    [zeros(1,2),ones(1,4),zeros(1,2)];
    -[zeros(1,2),ones(1,4),zeros(1,2)];
    ];
elseif kind==6
    A = [C'+[b*Q(1:2,:);0;0;b*Q(8,:);zeros(3,1)]';
    -Q'+QQ';
    ones(1,8);
    -ones(1,8);
    [zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2)];
    [ones(1,2),zeros(1,6)];
    -[ones(1,2),zeros(1,6)];
    ];
elseif kind==7
    A = [C'+[b*Q(1:2,:);0;0;b*Q(8,:);zeros(3,1)]';
    -Q'+QQ';
    ones(1,8);
    -ones(1,8);
    [zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2)];
    zeros(1,8);
    -zeros(1,8);
    ];
end
bb = [investment-b*c;0;8;0;1;0;0;0];
lb = zeros(8,1);
ub = ones(8,1);
[x,favl] = intlinprog(f,intcon,A,bb,[],[],lb,ub);
vaule = -favl+(a*c-b*c);