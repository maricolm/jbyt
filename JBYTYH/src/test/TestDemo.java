package test;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class TestDemo {

	@Test
	public void test() throws Exception {
		List<String> temp=new ArrayList<String>();
		int[] kind= {1,2};
		temp.add("1");
		temp.add("2");
		temp.add("3");
		temp.add("12");
		temp.add("13");
		temp.add("23");
		temp.add("123");
		StringBuffer kind1=new StringBuffer();
		for(int i=0;i<kind.length;i++) {
			kind1.append(kind[i]);
		}
		int x=temp.indexOf(kind1.toString())+1;
		System.out.println(x);
			
	}
	
	@Test
	public void testNum() {
		//DecimalFormat df = new DecimalFormat("#.0000");
		//System.out.println(df.format(new BigDecimal(1.1315789)));
		//System.out.println(Double.parseDouble((String.format("%.2f", 1.1354789))));
		double[] xResult={0,0,1,1,0,1,1,0};
		int year=1;
		List<Integer> Result=new ArrayList<Integer>() ;
		for(int i=0;i<xResult.length;i++) {
			if(xResult[i]>0.5) {
				Result.add(year+i*5);
			}
		}
			System.out.println(Result.toString());
		
		double[] xResult1={0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,1,1,0};
		// [11, 16, 26, 31]
		List<Integer> re=new ArrayList<Integer>();
		for(int i=0;i<xResult1.length;i++) {
			if(xResult1[i]>0.5) {
				re.add(i/8+1+i%8*5);
			}
		}
		
		System.out.println(re.toString());
	}

}
