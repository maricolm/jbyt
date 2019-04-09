function [x,vaule]=mixTwo(C,Q,QQ,kind,a,b,c,investment)
% a�ͼۣ�0.35��b:���Ͳ����ɱ���0.08��kind:���������˼��c=5200,�������ͣ�investment:��Ͷ��Ǯ
C=C';
Q=Q';
QQ=QQ';
f = C-a*Q+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1)];
intcon = 1:16;
if kind==1
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1)]';
        -Q'+QQ';
        %������������
        [ones(1,8),zeros(1,8)];
        -[ones(1,8),zeros(1,8)];
        [zeros(1,8),ones(1,8)];
        - [zeros(1,8),ones(1,8)];
        %  �ˮ�;ۺ��ﻥ��
        [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
        - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
        %ͬ�ִ�ʩʵʩ����ֻѡһ��
        [1,zeros(1,7),1,zeros(1,7)];
        -[1,zeros(1,7),1,zeros(1,7)];
        [0,1,zeros(1,7),1,zeros(1,6)];
        - [0,1,zeros(1,7),1,zeros(1,6)];
        [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
        - [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
        [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
        - [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
        [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
        - [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
        [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
        - [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
        [zeros(1,6),1,zeros(1,7),1,0];
        - [zeros(1,6),1,zeros(1,7),1,0];
        [zeros(1,7),1,zeros(1,7),1];
        - [zeros(1,7),1,zeros(1,7),1];
        %ֻѡ�������������෽��
        [zeros(1,2),ones(1,6),zeros(1,2),ones(1,6)];
        -[zeros(1,2),ones(1,6),zeros(1,2),ones(1,6)];
        ];
elseif kind==2
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,8)];
    -[ones(1,8),zeros(1,8)];
    [zeros(1,8),ones(1,8)];
    - [zeros(1,8),ones(1,8)];
    %  �ˮ�;ۺ��ﻥ��
     [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,6)];
    - [0,1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    - [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    - [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    - [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    - [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,0];
    - [zeros(1,6),1,zeros(1,7),1,0];
    [zeros(1,7),1,zeros(1,7),1];
    - [zeros(1,7),1,zeros(1,7),1];
    %ֻѡ��ʩ�෽��
      [ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2)];
    - [ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2)];
    ];
elseif kind==3
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1)]';
        -Q'+QQ';
   %������������
    [ones(1,8),zeros(1,8)];
    -[ones(1,8),zeros(1,8)];
    [zeros(1,8),ones(1,8)];
    - [zeros(1,8),ones(1,8)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,6)];
    - [0,1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    - [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    - [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    - [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    - [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,0];
    - [zeros(1,6),1,zeros(1,7),1,0];
    [zeros(1,7),1,zeros(1,7),1];
    - [zeros(1,7),1,zeros(1,7),1];
    %ֻѡ��߲������෽��
    [ones(1,6),zeros(1,2),ones(1,6),zeros(1,2)];
    -  [ones(1,6),zeros(1,2),ones(1,6),zeros(1,2)];
    ];
elseif kind==4
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,8)];
    -[ones(1,8),zeros(1,8)];
    [zeros(1,8),ones(1,8)];
    - [zeros(1,8),ones(1,8)];
    %  �ˮ�;ۺ��ﻥ��
   [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,6)];
    - [0,1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    - [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    - [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    - [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    - [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,0];
    - [zeros(1,6),1,zeros(1,7),1,0];
    [zeros(1,7),1,zeros(1,7),1];
    - [zeros(1,7),1,zeros(1,7),1];
    %ֻѡ��������������ʹ�ʩ�෽��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    -   [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    ];
elseif kind==5
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,8)];
    -[ones(1,8),zeros(1,8)];
    [zeros(1,8),ones(1,8)];
    - [zeros(1,8),ones(1,8)];
    %  �ˮ�;ۺ��ﻥ��
   [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,6)];
    - [0,1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    - [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    - [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    - [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    - [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,0];
    - [zeros(1,6),1,zeros(1,7),1,0];
    [zeros(1,7),1,zeros(1,7),1];
    - [zeros(1,7),1,zeros(1,7),1];
    %ֻѡ�����������������߲������෽��
    [zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2)];
    -   [zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2)];
    ];
elseif kind==6
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,8)];
    -[ones(1,8),zeros(1,8)];
    [zeros(1,8),ones(1,8)];
    - [zeros(1,8),ones(1,8)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,6)];
    - [0,1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    - [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    - [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    - [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    - [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,0];
    - [zeros(1,6),1,zeros(1,7),1,0];
    [zeros(1,7),1,zeros(1,7),1];
    - [zeros(1,7),1,zeros(1,7),1];
    %ֻѡ��ʩ�����߲������෽��
    [ones(1,2),zeros(1,6),ones(1,2),zeros(1,6)];
    -   [ones(1,2),zeros(1,6),ones(1,2),zeros(1,6)];
    ]; 
elseif kind==7
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,8)];
    -[ones(1,8),zeros(1,8)];
    [zeros(1,8),ones(1,8)];
    - [zeros(1,8),ones(1,8)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2)];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7)];
    -[1,zeros(1,7),1,zeros(1,7)];
    [0,1,zeros(1,7),1,zeros(1,6)];
    - [0,1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    - [zeros(1,2),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    - [zeros(1,3),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    - [zeros(1,4),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    - [zeros(1,5),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,6),1,zeros(1,7),1,0];
    - [zeros(1,6),1,zeros(1,7),1,0];
    [zeros(1,7),1,zeros(1,7),1];
    - [zeros(1,7),1,zeros(1,7),1];
    %ֻѡ3���෽��
    zeros(1,16);
    -zeros(1,16);
    ];
end;
bb = [investment-b*c;0;8;0;8;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;0;0];
lb = zeros(16,1);
ub = ones(16,1);
[x,favl] = intlinprog(f,intcon,A,bb,[],[],lb,ub);
vaule = -favl+(a*c-b*c);