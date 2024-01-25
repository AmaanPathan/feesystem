function j()
{
    var t1,t2,t3;
        t1=document.getElementById("txt1");
        t2=document.getElementById("txt2");
        t3=document.getElementById("txt3");
        
        var a,b,c,d,e,f;
        a=t1.value;
        b=t2.value;
        c=t3.value;

        var er1,er2,er3;
        er1=document.getElementById("sp1");
        er2=document.getElementById("sp2");
        er3=document.getElementById("sp3");


        er1.innerHTML="";
        er2.innerHTML="";
        er3.innerHTML="";

        if(a==null  || a=="")
        {
                er1.innerHTML="Enter old password";
                t1.focus();
                return false;
        }
        
        else if(b==null || b=="")
        {
                er2.innerHTML="Enter new password";
                t2.focus();
                return false;
        }
        
        else if(c==null || c=="")
        {
                er3.innerHTML="Enter confirsm password";
                t3.focus();
                return false;
        }
}



function H()
{
        var t1,t2,t3,t4,t5,t6;
        t1=document.getElementById("txt1");
        t2=document.getElementById("txt2");
        t3=document.getElementById("txt3");
        t4=document.getElementById("txt4");
       
        var a,b,c,d,e,f;
        a=t1.value;
        b=t2.value;
        c=t3.value;
        d=t4.value;
        
        var er1,er2,er3,er4,er5,er6;
        er1=document.getElementById("sp1");
        er2=document.getElementById("sp2");
        er3=document.getElementById("sp3");
        er4=document.getElementById("sp4");
        

        er1.innerHTML="";
        er2.innerHTML="";
        er3.innerHTML="";
        er4.innerHTML="";
        
        
        if(a==null  || a=="")
        {
                er1.innerHTML="Enter name";
                t1.focus();
                return false;
        }
        else if(pranjal(a)==false)
        {
                er1.innerHTML="Only use alphabets";
                t1.select();
                return false;
        }

        else if(b==null || b=="")
        {
                er2.innerHTML="Enter contact";
                t2.focus();
                return false;
        }
        else if(rishabh(b)==false)
        {
                er2.innerHTML="Enter only digits";
                t2.select();
                return false;
        }
        else if(amaan(b,6000000000,9999999999)==false)
        {
                er2.innerHTML="Enter valid contact";
                t2.select();
                return false;
        }

        else if(c==null || c=="")
        {
                er3.innerHTML="Enter address";
                t3.focus();
                return false;
        }
        

        else if(d==null || d=="")
        {
                er4.innerHTML="Enter email";
                t4.focus();
                return false;
        }
        
}

function B()
{
        var mg,tv;
        mg=document.getElementById("img1");
        tv=document.getElementById("txt5");
        if(tv.type=="password")
        {
                tv.type="text";
                mg.src="openeye.png";
        }
        else
        {
                tv.type="password";
                mg.src="closeeye.png";
        }

}

function A()
{
        var t1,t2,t3,t4,t5,t6;
        t1=document.getElementById("txt1");
        t2=document.getElementById("txt2");
        t3=document.getElementById("txt3");
        t4=document.getElementById("txt4");
        t5=document.getElementById("txt5");
        t6=document.getElementById("txt6");

        var a,b,c,d,e,f;
        a=t1.value;
        b=t2.value;
        c=t3.value;
        d=t4.value;
        e=t5.value;
        f=t6.value;

        var er1,er2,er3,er4,er5,er6;
        er1=document.getElementById("sp1");
        er2=document.getElementById("sp2");
        er3=document.getElementById("sp3");
        er4=document.getElementById("sp4");
        er5=document.getElementById("sp5");
        er6=document.getElementById("sp6");


        er1.innerHTML="";
        er2.innerHTML="";
        er3.innerHTML="";
        er4.innerHTML="";
        er5.innerHTML="";
        er6.innerHTML="";

        if(a==null  || a=="")
        {
                er1.innerHTML="*Enter name";
                t1.focus();
                return false;
        }
        else if(pranjal(a)==false)
        {
                er1.innerHTML="*Only use alphabets";
                t1.select();
                return false;
        }

        else if(b==null || b=="")
        {
                er2.innerHTML="*Enter contact";
                t2.focus();
                return false;
        }
        else if(rishabh(b)==false)
        {
                er2.innerHTML="*Enter only digits";
                t2.select();
                return false;
        }
        else if(amaan(b,6000000000,9999999999)==false)
        {
                er2.innerHTML="*Enter valid contact";
                t2.select();
                return false;
        }
        else if(c==null || c=="")
        {
                er3.innerHTML="*Enter address";
                t3.focus();
                return false;
        }
        


        else if(d==null || d=="")
        {
                er4.innerHTML="*Enter email";
                t4.focus();
                return false;
        }
        else if(e==null || e=="")
        {
                er5.innerHTML="*Enter password";
                t5.focus();
                return false;
        }
        else if(f==null || f=="")
        {
                er6.innerHTML="*Re Enter password";
                t6.focus();
                return false;
        }
        else if(gocher(e,f)==false)
        {
                er5.innerHTML="*Password does not match";
                t5.value="";
                t6.value="";
                t5.focus();
                return false;
        }
}



function pranjal(str)
{
        var f=true;
        for(var i=0;i<str.length; i++)
        {
                var ch=str.charAt(i); //fetch character from string
                if(ch>='a'&&ch<='z' || ch>='A'&&ch<='Z' || ch==' ')
                {
                        f=true;
                }
                else
                {
                        f=false;
                        break;
                }
        }
        return f;
}


function rishabh(str)
{
        var f=true;
        for(var i=0;i<str.length; i++)
        {
                var ch=str.charAt(i); //fetch character from string
                if(ch>='0'&&ch<='9')
                {
                        f=true;
                }
                else
                {
                        f=false;
                        break;
                }
        }
        return f;
}


function amaan(v,mn,mx)
{
        if(v<mn || v>mx)
        {
                return false;
        }
        else
        {
                return true;
        }
}


function gocher(p1,p2)
{
        if(p1==p2)
        {
                return true;
        }
        else
        {
                return false;
        }
}

function fees(p1,p2)
{
        if(p1<=p2)
        {
                return true;
        }
        else
        {
                return false;
        }
}

function amount()
{
    var t1,t2,t3;
        t1=document.getElementById("txt1");
        t2=document.getElementById("txt3");
        t3=document.getElementById("txt4");
        
        var a,b;
        a=t1.value;
        b=t2.value;
        

        var er1,er2;
        er1=document.getElementById("sp1");
        er2=document.getElementById("sp2");
     


        er1.innerHTML="";
        er2.innerHTML="";
        

        
        if(a==null || a=="")
        {
                er1.innerHTML="Enter amount";
                t1.focus();
                return false;
        }
        else if(fees(a,b)==false)
        {
                er1.innerHTML="*Amount Exceeded";
                t1.value="";
                t2.value="";
                t1.focus();
                alert("Amount Exceeded! Refresh");
                return false;
        }
        
        
        
        
    
}