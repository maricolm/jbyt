function [x,vaule]=mixThree(C,Q,QQ,kind,a,b,c,investment)
% a油价，0.35；b:吨油操作成本，0.08；kind:是种类的意思；c=52000,基本增油；investment:总投资钱
C=C';
Q=Q';
QQ=QQ';
f = C-a*Q+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1)];
intcon = 1:24;
if kind==1
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1)]';
        -Q'+QQ';
        %方案个数限制
        [ones(1,8),zeros(1,16)];
        -[ones(1,8),zeros(1,16)];
        [zeros(1,8),ones(1,8),zeros(1,8)];
        -[zeros(1,8),ones(1,8),zeros(1,8)];
        [zeros(1,16),ones(1,8)];
        -[zeros(1,16),ones(1,8)];
        %  活化水和聚合物互斥
        [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
        -[zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
        %同种措施实施年限只选一种
        [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
        -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
        [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
        -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
        [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
        -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
        [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
        -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
        [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
        -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
        [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
        -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
        [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
        -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
        [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
        -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
        %只选开发技术政策类方案
        [zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6)];
        -[zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6)];
        ];
elseif kind==2
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1)]';
        -Q'+QQ';
    %方案个数限制
    [ones(1,8),zeros(1,16)];
    -[ones(1,8),zeros(1,16)];
    [zeros(1,8),ones(1,8),zeros(1,8)];
     -[zeros(1,8),ones(1,8),zeros(1,8)];
    [zeros(1,16),ones(1,8)];
    -[zeros(1,16),ones(1,8)];
    %  活化水和聚合物互斥
     [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
   %同种措施实施年限只选一种
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
   [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
     [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
     %只选措施类方案
      [ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2)];
    - [ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2)];
     ];
elseif kind==3
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1)]';
        -Q'+QQ';
    %方案个数限制
    [ones(1,8),zeros(1,16)];
    -[ones(1,8),zeros(1,16)];
    [zeros(1,8),ones(1,8),zeros(1,8)];
    -[zeros(1,8),ones(1,8),zeros(1,8)];
    [zeros(1,16),ones(1,8)];
    -[zeros(1,16),ones(1,8)];
    %  活化水和聚合物互斥
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    %同种措施实施年限只选一种
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
    %只选提高采收率类方案
    [ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2)];
    -  [ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2)];
    ];
elseif kind==4
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1)]';
        -Q'+QQ';
    %方案个数限制
    [ones(1,8),zeros(1,16)];
    -[ones(1,8),zeros(1,16)];
    [zeros(1,8),ones(1,8),zeros(1,8)];
     -[zeros(1,8),ones(1,8),zeros(1,8)];
    [zeros(1,16),ones(1,8)];
    -[zeros(1,16),ones(1,8)];
    %  活化水和聚合物互斥
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
   %同种措施实施年限只选一种
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
   [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
     [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
     %只选开发技术政策类和措施方案
      [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    -   [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
     ]; 
elseif kind==5
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1)]';
        -Q'+QQ';
    %方案个数限制
    [ones(1,8),zeros(1,16)];
    -[ones(1,8),zeros(1,16)];
    [zeros(1,8),ones(1,8),zeros(1,8)];
     -[zeros(1,8),ones(1,8),zeros(1,8)];
    [zeros(1,16),ones(1,8)];
    -[zeros(1,16),ones(1,8)];
    %  活化水和聚合物互斥
     [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
   %同种措施实施年限只选一种
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
   [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
     [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
     %只选开发技术政策类和提高采收率类方案
      [zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2)];
    -    [zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2)];
     ];
elseif kind==6
     A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1)]';
        -Q'+QQ';
    %方案个数限制
    [ones(1,8),zeros(1,16)];
    -[ones(1,8),zeros(1,16)];
    [zeros(1,8),ones(1,8),zeros(1,8)];
     -[zeros(1,8),ones(1,8),zeros(1,8)];
    [zeros(1,16),ones(1,8)];
    -[zeros(1,16),ones(1,8)];
    %  活化水和聚合物互斥
     [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
   %同种措施实施年限只选一种
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
   [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
     [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
     %只选措施类和提高采收率方案
      [ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6)];
    -  [ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6)];
     ];
elseif kind==7
     A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1)]';
        -Q'+QQ';
     %方案个数限制
    [ones(1,8),zeros(1,16)];
    -[ones(1,8),zeros(1,16)];
    [zeros(1,8),ones(1,8),zeros(1,8)];
     -[zeros(1,8),ones(1,8),zeros(1,8)];
    [zeros(1,16),ones(1,8)];
    -[zeros(1,16),ones(1,8)];
    %  活化水和聚合物互斥
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    -[zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
   %同种措施实施年限只选一种
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
   [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,0];
     [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1];
     %只选3类方案
      zeros(1,24);
    -zeros(1,24);
     ];
end;
bb = [investment-b*c;0;8;0;8;0;8;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;0;0];
lb = zeros(24,1);
ub = ones(24,1);
[x,favl] = intlinprog(f,intcon,A,bb,[],[],lb,ub);
vaule = -favl+(a*c-b*c);
