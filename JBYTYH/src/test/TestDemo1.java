/**  
 * @Title:  TestDemo.java   
 * @Package matlabDemo   
 * @Description:    TODO(用一句话描述该文件做什么)   
 * @author: muliming     
 * @date:   2018年7月13日 上午10:57:39   
 * @Copyright: 2018
 */  
package test;

import java.io.File;
import org.junit.Test;
import matlabcontrol.MatlabProxy;
import matlabcontrol.MatlabProxyFactory;
import matlabcontrol.MatlabProxyFactoryOptions;

/**   
 * @ClassName:  TestDemo   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author: muliming 
 * @date:   2018年7月13日 上午10:57:39     
 * @Copyright: 2018 
 */
public class TestDemo1 {

	@Test
	public void xia() throws Exception {
		 MatlabProxyFactory factory = new MatlabProxyFactory();
		 MatlabProxy proxy = factory.getProxy();
		try{
			double p=0.2;
			double[] Q={13795,537,2000,3000,4000,7049};
			double[] C={65,-50,100,300,600,1080};
			double m=2;
			double M=5;
			double QQ=10000;
			double c=10000;
			Object[] result = proxy.returningFeval("demo",5,p,Q,C,m,M,QQ,c);
			double[] r=(double[]) result[0];
			System.out.print("f:");
			for (int i = 0; i < r.length; i++) {
				System.out.print(r[i]);
			}
			double[] x=(double[]) result[1];
			System.out.println();
			System.out.print("x:");
			for (int i = 0; i < x.length; i++) {
				System.out.print(x[i]);
			}
			Object[] r4=(Object[]) result[4];
			String[] key=(String[]) r4[0];
			for (int i = 0; i < key.length; i++) {
				System.out.println(key[i]);
			}
			Object[] val=(Object[]) r4[1];
			for (int i = 0; i < val.length; i++) {
				System.out.println(val[i]);
			}
			proxy.exit();
		}catch(Exception e){
			System.out.println(e.getMessage());
			proxy.exit();
		}
	}
	
	
	@Test
	public void test1(){
		File file = new File("F:\\javawebWorkspace\\matlabDemo");
    	MatlabProxyFactoryOptions options = new MatlabProxyFactoryOptions.Builder()
    	.setProxyTimeout(300000L)
    	.setMatlabStartingDirectory(file)
    	.setHidden(true)
    	.build();
    	MatlabProxyFactory factory = new MatlabProxyFactory(options);
    	MatlabProxy proxy=null;
		try{
			proxy = factory.getProxy();
			double p=0.2;
			double[] Q={13795,537,2000,3000,4000,7049};
			double[] C={65,-50,100,300,600,1080};
			double m=2;
			double M=5;
			double QQ=10000;
			double c=10000;
			Object[] result = proxy.returningFeval("demo",5,p,Q,C,m,M,QQ,c);
			double[] r=(double[]) result[0];
			System.out.print("f:");
			for (int i = 0; i < r.length; i++) {
				System.out.print(r[i]);
			}
			double[] x=(double[]) result[1];
			System.out.println();
			System.out.print("x:");
			for (int i = 0; i < x.length; i++) {
				System.out.print(x[i]);
			}
			proxy.exit();
		}catch(Exception e){
			System.out.println(e.getMessage());
			
		}
	}
	
	@Test
	public void testASC(){
		String value="201722000311";
		StringBuffer sbu = new StringBuffer();  
	    char[] chars = value.toCharArray();   
	    for (int i = 0; i < chars.length; i++) {  
	        if(i != chars.length - 1)  
	        {  
	            sbu.append((int)chars[i]+4).append(",");  
	        }  
	        else {  
	            sbu.append((int)chars[i]+4);  
	        }  
	    }  
	    System.out.println(sbu.toString());  
	    asciiToString(sbu.toString());
	}
	
	public  void asciiToString(String value)  
	{  
	    StringBuffer sbu = new StringBuffer();  
	    String[] chars = value.split(",");  
	    for (int i = 0; i < chars.length; i++) {  
	        sbu.append((char) Integer.parseInt(chars[i]));  
	    }  
	    System.out.println("{SRUN2}"+sbu.toString()+"@stu");
	} 
	@Test
	public void ff(){
		char s='w';
		//System.out.println((int)s);
		int d=119;
		System.out.println((char)d);
	}
	
	
	@Test
	public void one() throws Exception {
		 MatlabProxyFactory factory = new MatlabProxyFactory();
		 MatlabProxy proxy = factory.getProxy();
		try{
			double[] C={54.54,-50.42,180,150,280,391,596,299};
			double[] Q={6902.7,536.82,752.4,582,936.8,620.8,2268.0,1309.5};
			double[] QQ={1590.14,-32.51,514.29,428.57,994.66,1117.14,1702.86,854.29};
			double kind=6;
			double a=0.35;
			double b=0.08;
			double c=5200;
			double investment=55000;
			Object[] result = proxy.returningFeval("singleModel",2,C,Q,QQ,kind,a,b,c,investment);
			double[] x=(double[]) result[0];
			System.out.print("第"+kind+"钟方案");
			for (int i = 0; i < x.length; i++) {
				System.out.print(x[i]+"  ");
			}
			proxy.exit();
		}catch(Exception e){
			System.out.println(e.getMessage());
			proxy.exit();
		}
	}
	
	@Test
	public void mixTwo() throws Exception {
	//% a油价，0.35；b:吨油操作成本，0.08；kind:是种类的意思；c=52000,基本增油；investment:总投资钱
		 MatlabProxyFactory factory = new MatlabProxyFactory();
		 MatlabProxy proxy = factory.getProxy();
		try{
			double[] C={54.54,-50.42,180,150,280,391,596,299,227.05,-110.92,360,300,154,782,687,598};
			double[] Q={6902.7,536.82,752.4,582,936.8,620.8,2268.0,1309.5,46704.17,2574.5,1345.2,1047.6,1653.92,1117.44,2575.35,2182.5};
			double[] QQ={1590.14,-32.51,514.29,428.57,994.66,1117.14,1702.86,854.29,4868.59,239.62,490.91,409.09,381.30,1066.36,947.66,815.45};
			double kind=6;
			double a=0.35;
			double b=0.08;
			double c=5200;
			double investment=11000;
			Object[] result = proxy.returningFeval("mixTwo",2,C,Q,QQ,kind,a,b,c,investment);
			double[] x=(double[]) result[0];
			System.out.print("第"+kind+"钟方案");
			for (int i = 0; i < x.length; i++) {
				System.out.print(x[i]+"  ");
			}
			proxy.exit();
		}catch(Exception e){
			System.out.println(e.getMessage());
			proxy.exit();
		}
	}
	
	@Test
	public void mixThree() throws Exception {
	//% a油价，0.35；b:吨油操作成本，0.08；kind:是种类的意思；c=52000,基本增油；investment:总投资钱
		 MatlabProxyFactory factory = new MatlabProxyFactory();
		 MatlabProxy proxy = factory.getProxy();
		try{
			double[] C={54.54,-50.42,180,150,280,391,596,299,227.05,-110.92,360,300,154,782,687,598,350.9,-171.43,540,450,154,1173,947,858};
			double[] Q={6902.7,536.82,752.4,582,936.8,620.8,2268.0,1309.5,46704.17,2574.5,1345.2,1047.6,1653.92,1117.44,2575.35,2182.5,89877.23,6455.36,1819.44,1420.08,3284.79,1514.75,3273.75,2797.09};
			double[] QQ={1590.14,-32.51,514.29,428.57,994.66,1117.14,1702.86,854.29,4868.59,239.62,490.91,409.09,381.30,1066.36,947.66,815.45,17443.69,718.85,1406.85,1172.37,1042.66,3055.99,2509.26,2244.84};
			double kind=3;
			double a=0.35;
			double b=0.08;
			double c=52000;
			double investment=16500;
			Object[] result = proxy.returningFeval("mixThree",2,C,Q,QQ,kind,a,b,c,investment);
			double[] x=(double[]) result[0];
			System.out.print("第"+kind+"钟方案");
			for (int i = 0; i < x.length; i++) {
				System.out.print(x[i]+"  ");
			}
			proxy.exit();
		}catch(Exception e){
			System.out.println(e.getMessage());
			proxy.exit();
		}
	}
	
	@Test
	public void mixFour() throws Exception {
	//% a油价，0.35；b:吨油操作成本，0.08；kind:是种类的意思；c=52000,基本增油；investment:总投资钱
		 MatlabProxyFactory factory = new MatlabProxyFactory();
		 MatlabProxy proxy = factory.getProxy();
		try{
			double[] C={54.54,-50.42,180,150,280,391,596,299,227.05,-110.92,360,300,154,782,687,598,350.9,-171.43,540,450,154,1173,947,858,598.59,-146.2,900,750,154,1955,1467,1417};
			double[] Q={6902.7,536.82,752.4,582,936.8,620.8,2268.0,1309.5,46704.17,2574.5,1345.2,1047.6,1653.92,1117.44,2575.35,2182.5,89877.23,6455.36,1819.44,1420.08,3284.79,1514.75,3273.75,2797.09,204820,11375.29,2483.38,1941.55,7853.6,2070.99,3927.45,3545.78};
			double[] QQ={1590.14,-32.51,514.29,428.57,994.66,1117.14,1702.86,854.29,4868.59,239.62,490.91,409.09,381.30,1066.36,947.66,815.45,17443.69,718.85,1406.85,1172.37,1042.66,3055.99,2509.26,2244.84,6505.08,208.34,448.31,373.59,341.93,1564,766.84,700.74};
			double kind=6;
			double a=0.35;
			double b=0.08;
			double c=52000;
			double investment=22000;
			Object[] result = proxy.returningFeval("mixFour",2,C,Q,QQ,kind,a,b,c,investment);
			double[] x=(double[]) result[0];
			double[] val=(double[]) result[1];
			System.out.print("第"+kind+"钟方案");
			for (int i = 0; i < x.length; i++) {
				System.out.print(x[i]+"  ");
			}
			System.out.println();
			System.out.println(val[0]);
			proxy.exit();
		}catch(Exception e){
			System.out.println(e.getMessage());
			proxy.exit();
		}
	}
	
	@Test
	public void mixFive() throws Exception {
	//% a油价，0.35；b:吨油操作成本，0.08；kind:是种类的意思；c=52000,基本增油；investment:总投资钱
		 MatlabProxyFactory factory = new MatlabProxyFactory();
		 MatlabProxy proxy = factory.getProxy();
		try{
			double[] C={54.54,-50.42,180,150,280,391,596,299,227.05,-110.92,360,300,154,782,687,598,350.9,-171.43,540,450,154,1173,947,858,598.59,-146.2,900,750,154,1955,1467,1417,598.59,-146.2,900,750,154,1955,1467,1417,720};
			double[] Q={6902.7,536.82,752.4,582,936.8,620.8,2268.0,1309.5,46704.17,2574.5,1345.2,1047.6,1653.92,1117.44,2575.35,2182.5,89877.23,6455.36,1819.44,1420.08,3284.79,1514.75,3273.75,2797.09,204820,11375.29,2483.38,1941.55,7853.6,2070.99,3927.45,3545.78,204820,11375.29,2483.38,1941.55,7853.6,2070.99,3927.45,3545.78,68626.45};
			double[] QQ={1590.14,-32.51,514.29,428.57,994.66,1117.14,1702.86,854.29,4868.59,239.62,490.91,409.09,381.30,1066.36,947.66,815.45,17443.69,718.85,1406.85,1172.37,1042.66,3055.99,2509.26,2244.84,6505.08,208.34,448.31,373.59,341.93,1564,766.84,700.74,35020.00,1442.55,2144.50,1787.09,1720.64,4658.34,3574.76,3386.45,13233.61};
			double kind=15;
			double a=0.35;
			double b=0.08;
			double c=52000;
			double investment=30000;
			Object[] result = proxy.returningFeval("mixFive",2,C,Q,QQ,kind,a,b,c,investment);
			double[] x=(double[]) result[0];
			System.out.print("第"+kind+"钟方案");
			for (int i = 0; i < x.length; i++) {
				System.out.print(x[i]+"  ");
			}
			proxy.exit();
		}catch(Exception e){
			System.out.println(e.getMessage());
			proxy.exit();
		}
	}
}
