function [x,vaule]=mixFive(C,Q,QQ,kind,a,b,c,investment)
% a�ͼۣ�0.35��b:���Ͳ����ɱ���0.08��kind:���������˼��c=52000,�������ͣ�investment:��Ͷ��Ǯ
C=C';
Q=Q';
QQ=QQ';
f = C-a*Q+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);...
    b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)];
intcon = 1:41;
if kind==1
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
        %������������
        [ones(1,8),zeros(1,33)];
        -[ones(1,8),zeros(1,33)];
        [zeros(1,8),ones(1,8),zeros(1,25)];
        -[zeros(1,8),ones(1,8),zeros(1,25)];
        [zeros(1,16),ones(1,8),zeros(1,17)];
        -[zeros(1,16),ones(1,8),zeros(1,17)];
        [zeros(1,24),ones(1,8),zeros(1,9)];
        -[zeros(1,24),ones(1,8),zeros(1,9)];
        [zeros(1,32),ones(1,9),];
        -[zeros(1,32),ones(1,9)];
        %  �ˮ�;ۺ��ﻥ��
        [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
        -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
        %ͬ�ִ�ʩʵʩ����ֻѡһ��
        [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
        -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
        [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
        -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
        [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
        -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
        [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
        -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
        [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
        -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
        [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
        -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
        [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
        -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
        [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
        -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
        %ֻѡ�������������෽��
        [zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,7)];
        -[zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,7)];
        ];
elseif kind==2
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
     %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
     %ֻѡ��ʩ�෽��
      [ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,3)];
    -[ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,3)];
     ];
elseif kind==3
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ֻѡ��߲������෽��
    [ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),1];
    -[ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),1];
    ];
elseif kind==4
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ֻѡ���ܾ�����
      [ones(1,40),0];
    -[ones(1,40),0];
     ];
elseif kind==5
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ֻѡ��������������ʹ�ʩ����
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,3)];
    - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,3)];
    ];
elseif kind==6
     A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ֻѡ�����������������߲����ʷ���
    [zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),1];
    - [zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),1];
    ];
elseif kind==7
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ֻѡ��������������ͼ��ܾ�����
      [zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),0];
    - [zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),0];
     ];
elseif kind==8
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
     %ֻѡ��ʩ�����߲����ʷ���
      [ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),1];
    -   [ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),1];
     ];
elseif kind==9
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
     %ֻѡ��ʩ��ͼ��ܾ�����
      [ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),0];
    -  [ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),ones(1,2),zeros(1,4),ones(1,2),0];
     ];
elseif kind==10
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
     %ѡȡ��߲�������ͼ��ܾ�����
      [ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,3)];
    -  [ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,2),ones(1,6),zeros(1,3)];
     ];
elseif kind==11
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
     %ѡ�������������ࡢ��ʩ�����߲����ʷ���
      [zeros(1,40),1];
    -  [zeros(1,40),1];
     ];
elseif kind==12
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
     %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ѡ�������������ࡢ��ʩ��ͼ��ܾ�����
      [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    - [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
     ];
elseif kind==13
    A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ѡ�������������ࡢ��߲�������ͼ��ܾ�����
      [zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,3)];
    -  [zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,2),zeros(1,2),ones(1,4),zeros(1,3)];
     ];
elseif kind==14
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
    %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ѡ��ʩ�ࡢ��߲�������ͼ��ܾ�����
    [ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,7)];
    - [ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,7)];
    ];
elseif kind==15
   A = [C'+[b*Q(1:2,:);0;0;b*Q(5,:); zeros(3,1);b*Q(9:10,:);0;0;b*Q(13,:); zeros(3,1);b*Q(17:18,:);0;0;b*Q(21,:); zeros(3,1);b*Q(25:26,:);0;0;b*Q(29,:); zeros(3,1);
        b*Q(33:34,:);0;0;b*Q(37,:); zeros(3,1);b*Q(41,:)]';
        -Q'+QQ';
   %������������
    [ones(1,8),zeros(1,33)];
    -[ones(1,8),zeros(1,33)];
    [zeros(1,8),ones(1,8),zeros(1,25)];
    -[zeros(1,8),ones(1,8),zeros(1,25)];
    [zeros(1,16),ones(1,8),zeros(1,17)];
    -[zeros(1,16),ones(1,8),zeros(1,17)];
    [zeros(1,24),ones(1,8),zeros(1,9)];
    -[zeros(1,24),ones(1,8),zeros(1,9)];
    [zeros(1,32),ones(1,9),];
    -[zeros(1,32),ones(1,9)];
    %  �ˮ�;ۺ��ﻥ��
    [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    -  [zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),zeros(1,6),ones(1,2),0];
    %ͬ�ִ�ʩʵʩ����ֻѡһ��
    [1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    -[1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,8)];
    [0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    -[0,1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7)];
    [zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    -[zeros(1,2),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,6)];
    [zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    -[zeros(1,3),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,5)];
    [zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    -[zeros(1,4),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,4)];
    [zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    -[zeros(1,5),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,3)];
    [zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    -[zeros(1,6),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,2)];
    [zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    -[zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,zeros(1,7),1,0];
    %ѡ4���෽��
      zeros(1,41);
    - zeros(1,41);
     ]; 
end;
bb = [investment-b*c;0;8;0;8;0;8;0;8;0;9;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;1;0;0;0];
lb = zeros(41,1);
ub = ones(41,1);
[x,favl] = intlinprog(f,intcon,A,bb,[],[],lb,ub);
vaule = -favl+(a*c-b*c);