private void syso() {
		// TODO Auto-generated method stub
		int total = 0;
		for(int i=1; i<=80; i++ ) {
			total = total + i*i*i*i;
		}
		

	System.out.println(total);
	

	最初の3つの数は「1, 0, 5」である。
	それ以降は、直前の3つの整数の和を並べる。つまり、
	4番目の整数は 1 + 0 + 5 = 6
	5番目の整数は 0 + 5 + 6 = 11
	6番目の整数は 5 + 6 + 11 = 22
	この規則により、次のような列ができます。

	1, 0, 5, 6, 11, 22, 39, 72, ⋯

	この列の31番目の整数を求めてください。

	int[] totals = new int[30]; 
	totals[0] = 1;
	totals[1] = 0;
	totals[2] = 5;
	for(int i=3;  i<=30; i++) {
		totals[i] = totals[i-3]+totals[i-2]+totals[i-3];
	}
	
	 int[] totals = new int[30]; 
		totals[0] = 1;
		totals[1] = 0;
		totals[2] = 5;
		for(int i=3;  i<=29; i++) {
			totals[i] = totals[i-3]+totals[i-2]+totals[i-1];
		}
			
		System.out.println(totals[29]);
	    }
	    public static void main(String[] args)
    {
    int[] totals = new int[31]; 
	totals[0] = 1;
	totals[1] = 0;
	totals[2] = 5;
	for(int i=3;  i<=30; i++) {
		totals[i] = totals[i-3]+totals[i-2]+totals[i-1];
	}
		
	System.out.println(totals[30]);
    }
}
	    *
	    *
	    */
/*
	3の倍数と3のつく数字だけ
	次の条件の少なくとも一方を満たす整数のことを「A的な数」と呼ぶことにします。

	3の倍数である。
	十進法で書いた場合に「3」が含まれる。
	例えば、9、31、42、135は何れも「A的な数」です。

	1から20000までの整数のうち「A的な数」だけを足し合わせたときの合計を求めてください。
*/
	
	public class main
	{
	    // tip: arguments are passed via the field below this editor
	    public static void main(String[] args)
	    {
	    int total = 0;
		
		for(int i=1;  i<=20000; i++) {
			if(i%3==0) {
	            total = total + i;
	            continue;
	        }
	        if(i % 10 == 3) {
	            total = total + i;
	            continue;

	        }
	        if((i % 100)/10 == 3) {
	            total = total + i;
	            continue;

	        }
	        if((i%1000)/100 == 3) {
	            total = total + i;
	            continue;

	        }
	        if((i%10000)/1000 == 3) {
	            total = total + i;
	            continue;

	        }
		}
	
		205円切手が30枚、82円切手が40枚、30円切手が40枚あります。

		これらの切手の全部または一部（1枚以上）を使って額面の和として表せる金額は何通りあるか、求めてください。

