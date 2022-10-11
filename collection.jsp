
<%@page import="java.io.*" import="java.sql.*" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ include file="header.jsp"%>
<%@ page import="java.io.PrintWriter" %>  

<jsp:useBean id="tally" class="com.tally.beans.TALLY" scope="page">
<style>
			body
			{
            margin: 0px;
            padding: 0px;
            }
            
            #divheader
            {
            height:50;
            background:	White;
            }
            
            #header 
            {
            background: #2675a8;
            font:large;
            color:green;
            width: 100%;
            }
            
            #leftcolumn 
            {
            background:#0099CC;
            float: left;
            width: 35%;
            height: 400px;
            }
            
            #content 
            {
            border:medium;
            border-color:blue;
            background: ;
            float: left;
            width: 100%;
            height: 400px;
            overflow:scroll;
            }
            
            #myfooter 
            {
            background: #df781c;
            clear: both;
            width: 100%;
            }
            #tooltip
            {
  			  	position:relative;
    			font-family:arial,sans-serif;
    			font-size:10px;
    			color:#000;
    			padding:3px;
    			border:1px solid #000;
    			background-color:#ffe;
			}
			table.mysortable
			{
				text-align: left;
				font-family: Verdana, Geneva, Arial, Helvetica, sans-serif ;
				font-weight: normal;
				font-size: 11px;
				color: #fff;
				background-color: #1581AB; <!-- -->
				border: 0px;
				border-collapse: collapse;
				border-spacing: 0px;
			}

			table.mysortable td
			{
				background-color: #F8F8FF;
				color: #000;
				padding: 4px;
				border: 1px #808080 solid;
			}
			table.mysortable th
			{
				background-color: #1581AB;
				color: white;
				padding: 4px;
				border: 1px #808080 solid;
			}

			table.mysortable td.hed
			{
				background-color: #C6DEFF;
				color: #696969;
				padding: 4px;
				border-bottom: 2px #808080 solid;
				font-size: 12px;
				font-weight: bold;
			} 

			table.mysortable td.hed1
			{
				background-color: #C6DEFF;
				color: #696969;
				padding: 4px;
				border-bottom: 2px #808080 solid;
				font-size: 12px;
				font-weight: bold;
			} 

</style>

<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 -->
 <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>Payment Collection Report</title>
</head>

<body>

<script type="text/javascript">

//var t = new ScrollableTable(document.getElementById('invoice'), 100);
var mmoneyreceiptno="";
function gotoExcel(elemId, frmFldId)  
{  
	var originalContents = document.body.innerHTML;
	var input = document.tallydata.getElementsByTagName("a");
    var count = input.length;
    for(var i =0; i < count; i++)
    {
 		document.tallydata.getElementsByTagName("a")[i].removeAttribute("href");
    }
    var obj = document.getElementById(elemId);  
    var oFld = document.getElementById(frmFldId); 
    oFld.value = obj.innerHTML;  
    document.tallydata.action ="excel.jsp";
    document.forms["tallydata"].submit();
    document.body.innerHTML = originalContents;
}


function hide_tooltip()
{
	//document.getElementById("tooltipper").style.left=0
	//document.getElementById("tooltipper").style.top=0
	//document.getElementById("tooltipper").style.width= 1;
	//document.getElementById("tooltipper").style.height =1;
	document.getElementById("tooltipper").innerHTML="" ;
}

function show_tooltip(event,help_id)
{	
		var mhelp_id=help_id;
		var ajaxRequest;  // The variable that makes Ajax possible!
		try
		{
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		}  
		catch (e)
		{
			// Internet Explorer Browsers
			try
			{
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch (e)
			{
				try
				{
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} 
				catch (e)
				{
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
	     		document.getElementById('tooltipper').style.display='block';
				document.getElementById("tooltipper").style.left=event.clientX+5
				document.getElementById("tooltipper").style.top=event.clientY+10
				//document.getElementById("tooltipper").style.width= 250;
				//document.getElementById("tooltipper").style.height =100;
				document.getElementById("tooltipper").innerHTML=reslt;
			} 
		}
		var queryString = "?help_id=" +mhelp_id;
		ajaxRequest.open("GET", "GetHelp.jsp" + queryString, true);
		ajaxRequest.send(null); 
}

var initialAmountAgainstInvoice=0;
var amountAgainstInvoice=0;

function showInvoiceTable()
{
	
	amountAgainstInvoice=document.ereceipt.amount.value;
	initialAmountAgainstInvoice=document.ereceipt.amount.value;
	document.ereceipt.availBal.value=amountAgainstInvoice;
	document.getElementById('invoiceTable').innerHTML='<table> <tr><td>.</td></tr><tr><td><b>GETTING DATA...</b></td></tr></table>';
		
		var customer=document.ereceipt.customerName.value;
		customer=customer.replace("&","ampers")
		//alert(customer);
		var ajaxRequest;  // The variable that makes Ajax possible!

		try{
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		}  
		catch (e)
		{
			// Internet Explorer Browsers
			try
			{
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch (e)
			{
				try
				{
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} 
				catch (e)
				{
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				document.getElementById("invoiceTable").innerHTML=reslt;
				
			} 
		}
		var queryString = "?company=" +customer;
		//alert(queryString);
		ajaxRequest.open("GET", "GetInvoices.jsp" + queryString, true);
		ajaxRequest.send(null); 

		document.getElementById('invoiceTable').style.display='block';
}

function showInvoiceTable_e()
{
	
	amountAgainstInvoice=document.ereceipt.amount.value;
	initialAmountAgainstInvoice=document.ereceipt.amount.value;
	document.ereceipt.availBal.value=amountAgainstInvoice;
	document.getElementById('invoiceTable_e').innerHTML='<table> <tr><td>.</td></tr><tr><td><b>GETTING DATA...</b></td></tr></table>';
		
		var mmoneyreceiptno=document.ereceipt.e_moneyreceiptno.value;
		//alert(document.ereceipt.e_moneyreceiptno.value);
		
		var ajaxRequest;  // The variable that makes Ajax possible!

		try{
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		}  
		catch (e)
		{
			// Internet Explorer Browsers
			try
			{
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch (e)
			{
				try
				{
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} 
				catch (e)
				{
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				document.getElementById("invoiceTable_e").innerHTML=reslt;
				
			} 
		}
		var queryString = "?myvoucherno=" +mmoneyreceiptno;
		ajaxRequest.open("GET", "GetInvoices_e.jsp" + queryString, true);
		ajaxRequest.send(null); 
		document.getElementById('invoiceTable_e').style.display='block';
}

function tallyInvoice(i)
{
	 if(!(amountAgainstInvoice<=0) || document.getElementById('check'+i).checked==false)
		 {
		 var flag=0;
			 if(document.getElementById('check'+i).checked==false)
			 {
				 amountAgainstInvoice=initialAmountAgainstInvoice;
				
				 for(j=1;j<document.getElementById('checktotal').value;j++)
				 {
					 if(document.getElementById('check'+j).checked==true)
					 {
							if(parseFloat(document.getElementById('invoiceValue'+j).value)<parseFloat(amountAgainstInvoice))
							{
								document.getElementById('tdAmountAgainstInvoice'+j).innerHTML=document.getElementById('invoiceValue'+j).value;
								document.getElementById('amt'+j).value=parseFloat(document.getElementById('invoiceValue'+j).value);		
							}
							else
							{
							 	document.getElementById('tdAmountAgainstInvoice'+j).innerHTML=amountAgainstInvoice;
							 	document.getElementById('amt'+j).value=parseFloat(amountAgainstInvoice);
							}
						 amountAgainstInvoice=parseFloat(amountAgainstInvoice)-parseFloat(document.getElementById('invoiceValue'+j).value);
						 document.ereceipt.availBal.value=parseFloat(amountAgainstInvoice).toFixed(2);

						 if(document.ereceipt.availBal.value<0)
						 		document.ereceipt.availBal.value=0;
					 	flag=1;
					 }
				 } 
				document.getElementById('tr'+i).style.background='#E1F3F3';
				document.getElementById('tdAmountAgainstInvoice'+i).innerHTML='';
				document.getElementById('amt'+i).value=0;
				//alert(amountAgainstInvoice);
				if (flag==0)
				{
					amountAgainstInvoice=initialAmountAgainstInvoice;
					document.ereceipt.availBal.value=parseFloat(amountAgainstInvoice).toFixed(2);
				}
			 }
			 else
			 {
					if(parseFloat(document.getElementById('invoiceValue'+i).value)<parseFloat(amountAgainstInvoice))
					{
						document.getElementById('tdAmountAgainstInvoice'+i).innerHTML=document.getElementById('invoiceValue'+i).value;
						document.getElementById('amt'+i).value=parseFloat(document.getElementById('invoiceValue'+i).value);		
					}
					else
					{
					 	document.getElementById('tdAmountAgainstInvoice'+i).innerHTML=amountAgainstInvoice;
					 	document.getElementById('amt'+i).value=parseFloat(amountAgainstInvoice);
					}
				 	document.getElementById('tr'+i).style.background='#C6DEFF';
				 	amountAgainstInvoice=parseFloat(amountAgainstInvoice)-parseFloat(document.getElementById('invoiceValue'+i).value);
				 	
				 	document.ereceipt.availBal.value=parseFloat(amountAgainstInvoice).toFixed(2);
				 	if(document.ereceipt.availBal.value<0)
				 		document.ereceipt.availBal.value=0;
			 }
	 	}
	 else 
	{
		 alert("Payable amount not available");
		 document.getElementById('check'+i).checked=false;
	}	
}


function resetPaymentAmount()
{
	var amount=document.ereceipt.amount.value;
	var numericExpression = /^[0-9]+$/;
	if(!(amount.match(numericExpression))) 
	{
		  	alert("Payment value has to be Numeric");
	  		document.ereceipt.amount.value=document.ereceipt.amount.value.substring(0, document.receipt.amount.value.length-1);
			return false;
	} 
	for(j=1;j<document.getElementById('checktotal').value;j++)
	{
		 if(document.getElementById('check'+j).checked==true)
		 {
				 document.getElementById('check'+j).checked=false;
				 document.getElementById('tr'+j).style.background='white';
				 document.getElementById('tdAmountAgainstInvoice'+j).innerHTML='';
				 document.getElementById('amt'+j).value=0;
			 }
		 } 
		 initialAmountAgainstInvoice=amount;
	  	 amountAgainstInvoice=initialAmountAgainstInvoice;
		 document.receipt.availBal.value=parseFloat(amountAgainstInvoice);
}

function printcancelbutton()
{
	document.getElementById("printoption").style.visibility="hidden";
	window.location.reload();
}
function printokbutton()
{
	document.getElementById("printoption").style.visibility="hidden";
	document.ereceipt.action ="moneyreceipt.jsp?moneyreceiptno="+mmoneyreceiptno;//document.ereceipt.e_moneyreceiptno.value;
    document.forms["ereceipt"].submit();
}

function cancelbutton()
{
	document.ereceipt.voucherno.value="";
	document.ereceipt.customerName.value="";
	document.ereceipt.cheque_no.value="";
	document.ereceipt.amount.value="";
	document.ereceipt.invoiceno.value="";
	document.ereceipt.bankname.value="";
	document.ereceipt.branchname.value="";
	document.ereceipt.city.value="";
	document.ereceipt.e_remarks.value="";
	document.ereceipt.e_moneyreceiptno.value="";
	document.ereceipt.e_customercode.value="";
	document.ereceipt.e_tallyrefno.value="";
	document.ereceipt.e_auth_by.value="";
	document.ereceipt.e_auth_on.value="";
	document.ereceipt.e_insertdt.value="";
	document.ereceipt.e_twempname.value="";
	document.ereceipt.e_tds.value="";
	document.ereceipt.e_tdsamount.value="";
	document.getElementById("newentry").style.visibility="visible";
	document.getElementById("okc").style.visibility="hidden";
	document.getElementById("ok").style.visibility="hidden";
	document.getElementById("entry").style.visibility="hidden";
	 document.getElementById("e_tallyrefno").style.visibility="hidden";
	 document.getElementById("invoiceno").style.visibility="hidden";
	 document.getElementById("voucherno").style.visibility="hidden";
	 window.location.reload();
}

function show_hide()
{
	if (document.ereceipt.all_pending.value="All Entries")
	{
		document.ereceipt.all_pending.value="Pending Entries";
	}
	else
	{
		document.ereceipt.all_pending.value="All Entries";
	}
	
}

function okbutton()
{
	document.getElementById("newentry").style.visibility="visible";
	document.getElementById("entry").style.visibility="hidden";
	document.getElementById("okc").style.visibility="hidden";
	document.getElementById("ok").style.visibility="hidden";
	 document.getElementById("e_tallyrefno").style.visibility="hidden";
	 document.getElementById("invoiceno").style.visibility="hidden";
	 document.getElementById("voucherno").style.visibility="hidden";
	
}

function popUp(Address,companyName,SalesEnqNo)
{
    //alert("pop");
    window.open(Address+'?companyName='+companyName+'&SalesEnqNo='+SalesEnqNo,'jav','scrollbars=yes,menubar=yes,height=600,width=800,resizable=yes,toolbar=no,location=no,status=no');
}

function conformAll() {
    alert("CONFRM");
    alert(document.getElementByName(customername.options[1].value));/*
    while (ob.selectedIndex != -1) {
    if (ob.selectedIndex != 0)
    arSelected.push(ob.options[ob.selectedIndex].value);
    ob.options[ob.selectedIndex].selected = false;
    }*/
}
</script>

<script type="text/javascript" src="scrollabletable.js"></script>

<SCRIPT LANGUAGE="JavaScript">

function checkAll()
{
    var field=document.getElementsByName('checkbox1');
    var i;
    try
    {
         for (i = 0; i < field.length; i++)
         field[i].checked = true ;
    }
    catch(e)
    {
	    alert(e);
	}
}

function unCheckAll()
{
var field=document.getElementsByName('checkbox1');
var i;
try{
for (i = 0; i < field.length; i++)
field[i].checked = false ;
}catch(e){alert(e);}
}

function OnSubmitForm()
{
  if(document.pressed == 'submit')
  {
   document.payment.action ="epaymentupdate.jsp";
  }
  else
  if(document.pressed == 'Update')
  {
    document.payment.action ="update.html";
  }
  return true;
}

function changeScreenSize(w,h)
{
    window.resizeTo( w,h )
}

function getCustomer()
{
        document.getElementById("customerList").style.visibility="visible";
		var accounts=document.ereceipt.customerName.value;
		var ajaxRequest;  // The variable that makes Ajax possible!

		try
		{
			// Opera 8.0+, Firefox, Safari
			ajaxRequest = new XMLHttpRequest();
		}  
		catch (e)
		{
			// Internet Explorer Browsers
			try
			{
				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} 
			catch (e)
			{
				try
				{
					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} 
				catch (e)
				{
					// Something went wrong
					alert("Your browser broke!");
					return false;
				}
			}
		}

		// Create a function that will receive data sent from the server
		ajaxRequest.onreadystatechange = function()
		{
			if(ajaxRequest.readyState == 4)
			{
				var reslt=ajaxRequest.responseText;
				//alert(reslt);
				var mySplitResult = reslt.split("#");
				//alert(mySplitResult[15]);
				document.getElementById("customerList").innerHTML=reslt;
			} 
		}
		var queryString = "?accounts=" +accounts;
		ajaxRequest.open("GET", "AjaxGetCustomer.jsp" + queryString, true);
		ajaxRequest.send(null); 
	}

    function getAccountsDetails(i) 
    {
        //alert(document.getElementById("name"+i).value);
   		document.getElementById("customerList").style.visibility="hidden";
 		document.ereceipt.customerName.value=document.getElementById("name"+i).value;
	}

    function getBankAccounts()
    {
            document.getElementById("bankaccountsList").style.visibility="visible";
    		var accounts=document.ereceipt.bankname.value;
    		var ajaxRequest;  // The variable that makes Ajax possible!

    		try
    		{
    			// Opera 8.0+, Firefox, Safari
    			ajaxRequest = new XMLHttpRequest();
    		}  
    		catch (e)
    		{
    			// Internet Explorer Browsers
    			try
    			{
    				ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
    			} 
    			catch (e)
    			{
    				try
    				{
    					ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
    				} 
    				catch (e)
    				{
    					// Something went wrong
    					alert("Your browser broke!");
    					return false;
    				}
    			}
    		}

    		// Create a function that will receive data sent from the server
    		ajaxRequest.onreadystatechange = function()
    		{
    			if(ajaxRequest.readyState == 4)
    			{
    				var reslt=ajaxRequest.responseText;
    				//alert(reslt);
    				//var mySplitResult = reslt.split("#");
    				//alert(mySplitResult[15]);
    				document.getElementById("bankaccountsList").innerHTML=reslt;
    			} 
    		}
    		var queryString = "?accounts=" +accounts;
    		ajaxRequest.open("GET", "AjaxGetBankAccounts.jsp" + queryString, true);
    		ajaxRequest.send(null); 
    	}

        function getbankAccountsDetails(i) 
        {
            //alert(document.getElementById("name"+i).value);
       		document.getElementById("bankaccountsList").style.visibility="hidden";
     		document.ereceipt.bankname.value=document.getElementById("name"+i).value;
    	}

        function getReceipt(id,mf,action)
		{
		    //var accounts=document.payment.accountName.value;
		    var accounts=id;
			var modiflag = mf;
			var myaction = action;
			
            if (mf=="C" && id=="0")
            {
                accounts = document.ereceipt.e_moneyreceiptno.value;
            }
            var ajaxRequest;  // The variable that makes Ajax possible!
			try
			{
				// Opera 8.0+, Firefox, Safari
				ajaxRequest = new XMLHttpRequest();
			}  
			catch (e)
			{
				// Internet Explorer Browsers
				try
				{
					ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
				} 
				catch (e)
				{
					try
					{
						ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
					} 
					catch (e)
					{
						// Something went wrong
						alert("Your browser broke!");
						return false;
					}
				}
			}

			// Create a function that will receive data sent from the server
			ajaxRequest.onreadystatechange = function()
			{
				if(ajaxRequest.readyState == 4)
				{
					var reslt=ajaxRequest.responseText;
					//alert("Received data"+reslt);
                    if (modiflag=="C" && action == "GET")
                    {
                        var mySplitResult = reslt.split("zz");
                    	document.ereceipt.voucherno.value=mySplitResult[1];
						document.ereceipt.voucherdate.value=mySplitResult[2];
						document.ereceipt.customerName.value=mySplitResult[3];
						document.ereceipt.cheque_no.value=mySplitResult[4];
						document.ereceipt.chequedate.value=mySplitResult[5];
						document.ereceipt.amount.value=mySplitResult[6];
						document.ereceipt.invoiceno.value=mySplitResult[7];
						document.ereceipt.bankname.value=mySplitResult[8];
						document.ereceipt.branchname.value=mySplitResult[9];
						document.ereceipt.city.value=mySplitResult[10];
						document.getElementById('e_remarks').value=mySplitResult[11];
						document.ereceipt.e_moneyreceiptno.value=mySplitResult[12];
						document.ereceipt.e_customercode.value=mySplitResult[13];
						document.getElementById('paymentmode').value=mySplitResult[14];
						document.ereceipt.e_tallyrefno.value=mySplitResult[15];
						document.ereceipt.e_auth_by.value=mySplitResult[16];
						document.ereceipt.e_auth_on.value=mySplitResult[17];
						document.ereceipt.e_insertdt.value=mySplitResult[18];
						document.ereceipt.e_twempname.value=mySplitResult[19];
						document.ereceipt.e_tds.value=mySplitResult[20];
						document.ereceipt.e_tdsamount.value=mySplitResult[21];
						document.getElementById("newentry").style.visibility="hidden";
						document.getElementById("entry").style.visibility="visible";
						document.getElementById("ok").style.visibility="hidden";
						document.getElementById("okc").style.visibility="visible";
						mmoneyreceiptno=document.ereceipt.e_moneyreceiptno.value;
						
						showInvoiceTable_e();
				    }
                    if (modiflag=="N" && action == "POST")
                    {
                        var mySplitResult = reslt.split("#");
                        //alert(mySplitResult);
						document.ereceipt.voucherno.value="";
						document.ereceipt.customerName.value=mySplitResult[3];
						document.ereceipt.cheque_no.value="";
						document.ereceipt.amount.value="";
						document.ereceipt.invoiceno.value="";
						document.ereceipt.bankname.value="";
						document.ereceipt.branchname.value="";
						document.ereceipt.city.value="";
						document.ereceipt.e_remarks.value="";
						document.ereceipt.e_moneyreceiptno.value=mySplitResult[12];
						
						document.ereceipt.e_customercode.value="";
						document.ereceipt.e_tallyrefno.value="";
						document.ereceipt.e_auth_by.value="";
						document.ereceipt.e_auth_on.value="";
						document.ereceipt.e_insertdt.value="";
						document.ereceipt.e_twempname.value="";
						document.ereceipt.e_tds.value="";
						document.ereceipt.e_tdsamount.value="";
						var mcustomername=mySplitResult[3].replace("&","ampers");
						document.ereceipt.action ="collectioninv.jsp?myvoucherno="+mySplitResult[12]+"&customerName="+mcustomername;//?moneyreceiptno="+mySplitResult[12];//+document.ereceipt.e_moneyreceiptno.value;
						document.forms["ereceipt"].submit();
						alert("Entry Updated......");
						document.getElementById("newentry").style.visibility="visible";
						document.getElementById("okc").style.visibility="hidden";
						document.getElementById("ok").style.visibility="hidden";
						document.getElementById("entry").style.visibility="hidden";
						 document.getElementById("e_tallyrefno").style.visibility="hidden";
				    	 document.getElementById("invoiceno").style.visibility="hidden";
				    	 document.getElementById("voucherno").style.visibility="hidden";
						window.location.reload();
                    }
                    if (modiflag=="C" && action == "POST")
                    {
                        var mySplitResult = reslt.split("#");
						document.ereceipt.voucherno.value="";
						document.ereceipt.customerName.value="";
						document.ereceipt.cheque_no.value="";
						document.ereceipt.amount.value="";
						document.ereceipt.invoiceno.value="";
						document.ereceipt.bankname.value="";
						document.ereceipt.branchname.value="";
						document.ereceipt.city.value="";
						document.ereceipt.e_remarks.value="";
						document.ereceipt.e_moneyreceiptno.value="";
						document.ereceipt.e_customercode.value="";
						document.ereceipt.e_tallyrefno.value="";
						document.ereceipt.e_auth_by.value="";
						document.ereceipt.e_auth_on.value="";
						document.ereceipt.e_insertdt.value="";
						document.ereceipt.e_twempname.value="";
						document.ereceipt.e_tds.value="";
						document.ereceipt.e_tdsamount.value="";
						document.getElementById("newentry").style.visibility="visible";
						document.getElementById("okc").style.visibility="hidden";
						document.getElementById("ok").style.visibility="hidden";
						document.getElementById("entry").style.visibility="hidden";
						if (document.ereceipt.e_department.value=="Accounts" || document.ereceipt.e_department.value=="All")
					    {
								document.getElementById("printoption").style.visibility="visible";
					    }		
						//window.location.reload();
                    }
                    if (modiflag=="D" && action == "GET")
                    {                     
                        //alert(reslt);
						document.getElementById("newentry").style.visibility="visible";
						document.getElementById("entry").style.visibility="hidden";
						document.getElementById("ok").style.visibility="hidden";
						document.getElementById("okc").style.visibility="hidden";
						 document.getElementById("e_tallyrefno").style.visibility="hidden";
				    	 document.getElementById("invoiceno").style.visibility="hidden";
				    	 document.getElementById("voucherno").style.visibility="hidden";
						 window.location.reload();
                    }
       			} 
			}
			if (modiflag=='N' && action == 'POST')
			{ 
				
				var mPaymentmode = document.getElementById("paymentmode").value;
				var mcustomername =document.ereceipt.customerName.value.replace("&","ampers"); 
                var mysend_data = "zz"+document.ereceipt.voucherno.value+"zz"+document.ereceipt.voucherdate.value+"zz"+mcustomername+"zz"+document.ereceipt.cheque_no.value+"zz"+document.ereceipt.chequedate.value+"zz"+document.ereceipt.amount.value+"zz"+document.ereceipt.invoiceno.value+"zz"+document.ereceipt.bankname.value+"zz"+document.ereceipt.branchname.value+"zz"+document.ereceipt.city.value+"zz"+document.ereceipt.e_remarks.value+"zz"+document.ereceipt.e_moneyreceiptno.value+"zz"+document.ereceipt.e_customercode.value+"zz"+mPaymentmode+"zz"+document.ereceipt.e_tallyrefno.value+"zz"+document.ereceipt.e_auth_by.value+"zz"+document.ereceipt.e_auth_on.value+"zz"+document.ereceipt.e_insertdt.value+"zz"+document.ereceipt.e_twempname.value+"zz"+document.ereceipt.e_tds.value+"zz"+document.ereceipt.e_tdsamount.value;
                var queryString = "?id=" +accounts+"&modiflag="+modiflag+"&action="+myaction+"&mydata="+mysend_data;
                document.getElementById("ok").style.visibility="visible";
				document.getElementById("okc").style.visibility="hidden";
				
				//document.ereceipt.action ="collectioninv.jsp?moneyreceiptno="+document.ereceipt.e_moneyreceiptno;
				//document.forms["ereceipt"].submit();
			}
			if (modiflag=='C' && action == 'POST')
			{ 
				var mPaymentmode = document.getElementById("paymentmode").value;
				var mcustomername =document.ereceipt.customerName.value.replace("&","ampers"); 
				var mysend_data = "zz"+document.ereceipt.voucherno.value+"zz"+document.ereceipt.voucherdate.value+"zz"+mcustomername+"zz"+document.ereceipt.cheque_no.value+"zz"+document.ereceipt.chequedate.value+"zz"+document.ereceipt.amount.value+"zz"+document.ereceipt.invoiceno.value+"zz"+document.ereceipt.bankname.value+"zz"+document.ereceipt.branchname.value+"zz"+document.ereceipt.city.value+"zz"+document.ereceipt.e_remarks.value+"zz"+document.ereceipt.e_moneyreceiptno.value+"zz"+document.ereceipt.e_customercode.value+"zz"+mPaymentmode+"zz"+document.ereceipt.e_tallyrefno.value+"zz"+document.ereceipt.e_auth_by.value+"zz"+document.ereceipt.e_auth_on.value+"zz"+document.ereceipt.e_insertdt.value+"zz"+document.ereceipt.e_twempname.value+"zz"+document.ereceipt.e_tds.value+"zz"+document.ereceipt.e_tdsamount.value;
                var queryString = "?id=" +accounts+"&modiflag="+modiflag+"&action="+myaction+"&mydata="+mysend_data;
                document.getElementById("ok").style.visibility="visible";
				document.getElementById("okc").style.visibility="hidden";
				
				//document.ereceipt.action ="collectioninv.jsp?moneyreceiptno="+document.ereceipt.e_moneyreceiptno;
				//document.forms["ereceipt"].submit();


	        }
			if (modiflag=='D' && action == 'GET')
			{
			    var queryString = "?id=" +accounts+"&modiflag="+modiflag+"&action="+myaction+"&mydata=''";
			}
			if (modiflag=="N" && action=="GET")
		    {
				var queryString = "?id=" +accounts+"&modiflag="+modiflag+"&action="+myaction+"&mydata=''";
			    document.getElementById("newentry").style.visibility="hidden";
				document.getElementById("entry").style.visibility="visible";
				document.getElementById("ok").style.visibility="visible";
				document.getElementById("okc").style.visibility="hidden";
				if (document.ereceipt.e_department.value=="Accounts" || document.ereceipt.e_department.value=="All")
			    {
			      	document.getElementById("e_tallyrefno").style.visibility="visible";
			      	document.getElementById("invoiceno").style.visibility="visible";
			      	document.getElementById("voucherno").style.visibility="visible";
			    }
			    else
			    {
			    	 document.getElementById("e_tallyrefno").style.visibility="hidden";
			    	 document.getElementById("invoiceno").style.visibility="hidden";
			    	 document.getElementById("voucherno").style.visibility="hidden";
			    }
		    }
			if (modiflag=="C" && action=="GET")
		    {
				var queryString = "?id=" +accounts+"&modiflag="+modiflag+"&action="+myaction+"&mydata=''";
			    document.getElementById("newentry").style.visibility="hidden";
				document.getElementById("entry").style.visibility="visible";
				document.getElementById("ok").style.visibility="hidden";
				document.getElementById("okc").style.visibility="visible";
                
				if (document.ereceipt.e_department.value=="Accounts" || document.ereceipt.e_department.value=="All")
			    {
			      	document.getElementById("e_tallyrefno").style.visibility="visible";
			      	document.getElementById("invoiceno").style.visibility="visible";
			      	document.getElementById("voucherno").style.visibility="visible";
			    }
			    else
			    {
			    	 document.getElementById("e_tallyrefno").style.visibility="hidden";
			    	 document.getElementById("invoiceno").style.visibility="hidden";
			    	 document.getElementById("voucherno").style.visibility="hidden";
			    }
		    }
			
		    ajaxRequest.open("GET", "AjaxGetReceipt.jsp" + queryString, true);
			ajaxRequest.send(null);
		}
</script>

<form method="post" name="ereceipt" autocomplete="off">
      <%
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
      		java.util.Date d1 = null;
      		java.util.Date d2 = null;
            DecimalFormat df2 = new DecimalFormat( "0.00" );
            String voucherdate="",chequedate="",voucherdateCal="",chequedateCal="";
            Date today = new Date();
            Calendar cal = Calendar.getInstance();
			cal.setTime(today);
			cal.add(Calendar.DAY_OF_MONTH, -30);
			Date today30 = cal.getTime();
			String exportFileName="c:\\myimage.png";
			String todaysDateTime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
	
			voucherdateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			chequedateCal=new SimpleDateFormat("dd-MMM-yyyy").format(new java.util.Date());
			if (!(null == request.getParameter("voucherdate"))) 
			{
				voucherdate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("voucherdate")));
    			voucherdateCal=request.getParameter("voucherdate");
			}
			if (!(null == request.getParameter("chequedate")))
			{
    			chequedate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("dd-MMM-yyyy").parse(request.getParameter("chequedate")));
    			chequedateCal=request.getParameter("chequedate");
			}
			//onmouseover="javascript:show_tooltip(event,'1') 
			//onmouseout="javascript:hide_tooltip()" />
	  %>
      <div id="printoption" style="margin-left:35%;margin-top:15%; width:25%;height:20%;position:absolute;border:thin solid ;border-color: blue;background-color: #E1F3F3;color:white;-moz-border-radius-topleft: 20px;-moz-border-radius-bottomleft: 20px;-moz-border-radius-topright: 20px;-moz-border-radius-bottomright: 20px;">
      <div style="height:22;font-size:medium;text-align:center; background-color: #2678B7;color:white;
	-moz-border-radius-topleft:200px;-moz-border-radius-topright:200px;
	">
       &nbsp;&nbsp; &nbsp; Do you wish to Print ? &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
      <input type="button" name="xcancel" id="xcancel" value="X"  onclick="printcancelbutton()" style="width:20;height:22; color:red;" />
      </div>
      
      <table>
      
      <tr align="center"><td>
      
      </td>
      </tr>
      <tr><td>
      </td>
      </tr>
      <tr><td>
      </td>
      </tr>
      <tr><td>
      </td>
      </tr>
      <tr>
      <td>
      </td>
      </tr>
      <tr align="center"><td>
       Money Receipt & Credit Note !!!
      </td>
      </tr>
      <tr><td>
      </td>
      </tr>
      <tr><td>
      </td>
      </tr>
      <tr><td>
      </td>
      </tr>
      <tr>
      <td align="center">
      <input type="button" name="prin_Ok" id="print_ok" value="Ok"onclick="printokbutton()" style="width:80;"/>
     
      <input type="button" name="print_Cancel" id="print_cancel" value="Cancel" onclick="printcancelbutton()" style="width:80;" />
       </td>
      </tr>
      </table>
      </div>	  
      <script>document.getElementById("printoption").style.visibility="hidden";</script>
	  
      <div id="entry" style="margin-left:7%; margin-top:2%; height:425;width:86%; border:thin solid; border-color: blue;position:absolute; background-color: #E1F3F3; border-radius: 12px 12px 12px 12px;" >
      <div style="background-color:#2678B7;height:27;width:100%; color:white; font-size:small;border:thin solid; border-color: blue; border-radius: 12px 12px 0px 0px;"> 
     <!--  <div style="position:absolute;height: 395px; width:1; margin-left:47%; margin-top:3%;border:thin solid; border-color:blue; "></div> -->
      <table style="color: white; align:center;width:100%">
      <tr style="color: white; text-align:center;">
      <td width="80%"><strong>Voucher Entry</strong></td>
      <td align="right"><input type="button" name="cancel" id="cancel" value="X"  onclick="cancelbutton()" style="width:20; color:red;" />
      </td>
      </tr>
      </table>
       </div>
      <table style="font-size:small;width:100%">
      <tr>
	  <td><strong>Payment Mode:</strong></td>
      <td>
      <select id="paymentmode">
  			<option value="Cheque">Cheque</option>
  			<option value="Demand Draft">Demand Draft</option>
  			<option value="Cash">Cash</option>
  			<option value="NEFT">NEFT</option>
	 </select>
	 
     </td>
      <td>
      <strong>Available Balance:</strong><input type="text" name="availBal" id="availBal" value="" readonly="readonly" size="10"  style="text-align: right;">
       <input type="radio" name="invoice" value="invoice" onchange="showInvoiceTable()"><strong>Show Invoices</strong>
	  
     </td>

      </tr>
      <tr>
      <td width="100" ><strong>Payment Date:</strong></td>
      <td>
      <input type="text" id="voucherdate"
						name="voucherdate" value="<%=voucherdateCal %>" size="15" readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "voucherdate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "voucherdate"       // ID of the button
			    }
			  );
			</script></td>
			<td colspan="2"> <div id="invoiceTable" style="display:none; position:absolute; overflow:auto; height: 350px; width:420; font-size:small; ">
			 <table> <tr><td>.</td></tr>
			 <tr><td><b>GETTING DATA...</b></td></tr>
			 </table>
	 </div>
	 <div id="invoiceTable_e" style="display:none; position:absolute; overflow:auto; height: 350px; width:435; font-size:small; ">
			 <table> <tr><td>.</td></tr>
			 <tr><td><b>GETTING DATA...</b></td></tr>
			 </table>
	 </div></td>
			
	  </tr>
      <tr>
      <td><strong>Received from:</strong></td>
      <td colspan="3"><input type="text" name="customerName" id="received_from" value=""  size="45" onkeyup="getCustomer()" autocomplete="off" 
          onmouseout="javascript:hide_tooltip()" />
          
      <div id='customerList' style="position:absolute; background-color: white;">
	<div style="height: 150px; width: 315px; overflow: auto; border:solid inset;"></div>
	</div>
	 <script>document.getElementById("customerList").style.visibility="hidden";</script>
      </td>
	  <td></td>
      </tr>
      <tr>
      <td><strong>Amount Received:</strong></td>
      <td><input type="text" name="amount" id="amount" value=""  onkeyup="resetPaymentAmount();" size="10"  style="text-align: right;">
      <select name="e_tds" id="e_tds">
             <option value="TDS">TDS</option>
	     	 <option value="Other">Other</option>
      		</select>
      		<strong>Ded.</strong>
            <input type="text" name="e_tdsamount" id="e_tdsamount" value="0"  size="10"  style="text-align: right;">
      </td>
      <td>
      <input type="hidden" id="tableHTML" name="tableHTML" value="" />  
	<input type="hidden" id="fileName" name="fileName" value="<%= exportFileName%>" /> 
      </td>
      </tr>
       <tr>
      <td><strong>Cheque No:</strong></td>
      <td><input type="text" name="cheque_no" id="cheque_no" value=""  size="10" /></td>
      <td></td>
    </tr>
    <tr>
    <td width="100"><strong>Cheque Date:</strong></td>
      <td><input type="text" id="chequedate"
						name="chequedate" value="<%=chequedateCal %>" size="15" readonly
						style="width: 75px; padding: 4px 5px 2px 5px; border: 1px solid #DEDEDE; background: #FFFFFF; font: normal 11px Arial, Helvetica, sans-serif; background: #C6DEFF" />
					
			<script type="text/javascript">
			  Calendar.setup(
			    {
			      inputField  : "chequedate",         // ID of the input field
			      ifFormat    : "%d-%b-%Y",     // the date format
			      button      : "chequedate"       // ID of the button
			    }
			  );
			</script>
	</td>
	<td></td>
	<td></td>
    </tr>
    <tr>
    <td><strong>Bank Name:</strong></td>
    <td colspan="3">
    <input type="text" name="bankname" id="bankname" value="" size="45"  onkeyup="" />
    <div id='bankaccountsList' style="position:absolute; background-color: white;">
	<div style="height: 150px; width: 325px; overflow: auto; border:solid inset;"></div>
	</div>
	<script>document.getElementById("bankaccountsList").style.visibility="hidden";</script>
    </td>
	</tr>
    <tr>
    <td><strong>Branch Name:</strong></td>
    <td><input type="text" name="branchname" id="branchname" value=""  /></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td width="100"><strong>City:</strong></td>
    <td><input type="text" name="city" id="city" value=""  /></td>
    <td></td>
    <td></td>
    </tr>
    <tr valign="top">
    <td ><strong>Remarks:</strong></td>
	  <td>	  
	  <textarea id="e_remarks" name="e_remarks" rows="3" cols="25" ></textarea>
	   </td>
      </tr>
      <!-- 
      <tr>
      <td width="100" ><strong>Voucher No:</strong></td>
      <td width="300">
          </td>
      <td></td>
      <td></td>
      </tr>
       -->
    <tr>
    <td width="100"><strong>Tally Ref No:</strong></td>
    <td><input type="hidden" name="voucherno" id="voucherno" size="10" value="" />
    <input type="text" name="e_tallyrefno" id="e_tallyrefno" value=""  /></td>
    <td></td>
    <td></td>
    </tr>
      
      <tr>
      <td></td>
      <td colspan="3" align="left">
       <input type="button" name="Ok" id="ok" value="Ok" onclick="getReceipt('0','N','POST')" style="width:80;"/>
      <input type="button" name="Okc" id="okc" value="Ok"onclick="getReceipt('0','C','POST')" style="width:80;"/>
      <input type="button" name="Cancel" id="cancel" value="Cancel" onclick="cancelbutton()" style="width:80;" />
      </td>
      </tr>
      <tr>
      <td>
      <input type="hidden" name="invoiceno" id="invoiceno" value="0"  />
      <input type="hidden" name="EXCEL" id="EXCEL" value=""  />
      <input type="hidden" name="e_twempname" id="e_twempname" value=""  />
      <input type="hidden" name="e_auth_by" id="e_auth_by" value=""  />
      <input type="hidden" name="e_auth_on" id="e_auth_on" value=""  />
      <input type="hidden" name="e_insertdt" id="e_insertdt" value=""  />
      <input type="hidden" name="e_customercode" id="e_customercode" value=""  />
      <input type="hidden" name="e_moneyreceiptno" id="e_moneyreceiptno" value=""  />
      <input type="hidden" name="e_department" id="e_department" value="<%=session.getAttribute("department") %>"  />
      </td>
      </tr>
      </table>
     </div>
       <div id="data">
      <div id="divheader" style="height:55;">
      <table width="100%">
      <tr>
      <td colspan="4" align="center"><strong>[Payment Collections]</strong></td>
      </tr>
      <tr>
      <td align="left">
      
      </td>
      <td align="left">
      <div id="newentry" style="width:100%;">
     <a href="#" style="font-weight: bold; color: black; " onclick="getReceipt('0','N','GET')">
     <img src="images/new.JPG" width="25px" height="22px" style="border-style: none"></img>
     </a> 
      New Entry
      </div>
     </td>
      <td >
      <span style="background-color:#FDD5D8;margin-left:30%;font-size: 16px;" >&nbsp;&nbsp;&nbsp;&nbsp;</span>
     <span style="font-size: 16px; color:blue;" >&nbsp;= Uncleared Cheques</span>
   	  </td>
      <td width="40%" align="right"> 
      <a href="collectionreport.jsp" style="font-weight: bold; color: Blue; " >Collection Report</a> 
     </td>
     </tr>
     </table>
      </div>
      <script>document.getElementById("entry").style.visibility="hidden";</script>
      <div id="content">
     <table class="mysortable">
 
 
     <tr>
     		<th><div></div></th>
            <th><div></div></th>
            <th><div>Payment Mode</div></th>
            <th><div>VoucherNo</div></th>
            <th><div align="left">Receipt-Date</div></th>
            <th ><div align="left" style="width:300;">Received From</div></th>
            <th><div align="left" style="width:100;">Cheque No</div></th>
            <th><div align="left">Cheque Date</div></th>
            <th><div align="right">Amount</div></th>
            <th><div align="left" style="width:100;">Tally Ref No.</div></th>
            <th><div align="left">User Name</div></th>
            <th><div align="left" style="width:150;">Entered On</div></th>
            <th><div align="left" style="width:100;">TDS/Other</div></th>
            <th><div align="left" style="width:100;">Ded.Amount</div></th>
            <th><div align="left" style="width:600;">Remark</div></th>
        </tr>
	    <%
        try
        {
        	tally.getConnection(DB_Driver, DB_NAME, DB_USERNAME, DB_PASSWORD);
        	Connection conn = null;
        	Statement st = null;
        	String todaydate="";
	        todaydate=new SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date());
	        conn = tally.ReturnConnection();
        	st = conn.createStatement();
        	String sql="";
        	//if(request.getParameter("all_pending")!=null)
        	//{
        		sql="select * from "+session.getAttribute("CompanyMasterID").toString()+"collection as a inner join "+session.getAttribute("CompanyMasterID").toString()+"customerdet as b on a.customercode=b.customercode where tallyrefno = '  ' order by paymentdate";
        	//}
        	//else
        	//{
        	//	sql="select * from "+session.getAttribute("CompanyMasterID").toString()+"collection as a inner join "+session.getAttribute("CompanyMasterID").toString()+"customerdet as b on a.customercode=b.customercode where tallyrefno = '  ' order by paymentdate";
        	//}
        	ResultSet rs=st.executeQuery(sql);
        	System.out.println("Query is"+sql);
        	String mtoday=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
        	String mColorCode="white";
        	while(rs.next())
        	{
        		String mPayment_date =new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("a.paymentdate")));
        		String mpaydate=new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("a.paymentdate")));
        		String mCheque_date =new SimpleDateFormat("dd-MMM-yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("a.chorddorcreditnotedate")));
    			String mEntered_on=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss ").format(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rs.getString("a.inserdt")));
    			d1 = format.parse(mtoday);
    			d2 = format.parse(mpaydate);
    		    long diff = d1.getTime() - d2.getTime();
        		long diffDays = diff / (24 * 60 * 60 * 1000);
        		System.out.println(">>>"+rs.getString("a.tallyrefno")+"<<<");
        		if (diffDays > 2 && (rs.getString("a.tallyrefno").equals("")))
        		{
        			mColorCode="#FDD5D8";
        		}
        		else
        		{
        			mColorCode="white";
        		}
            %>
            <tr>
            <td style="background-color:<%=mColorCode%>;">
            <a href="#" style="font-weight: bold; color: black; " onclick="getReceipt(<%=rs.getString("a.moneyreceiptno")%>,'D','GET');">
            <img src="images/delete.JPG" width="20px" height="18px" style="border-style: none"></img>
            </a>
            <input type="hidden"  name="moneyreceiptno" value="<%=rs.getString("a.moneyreceiptno")%>" >
            </td>
            <td style="background-color:<%=mColorCode%>;">
            <a href="#" style="font-weight: bold; color: black; " onclick="getReceipt(<%=rs.getString("a.moneyreceiptno")%>,'C','GET');">
            <img src="images/edit.JPG" width="20px" height="18px" style="border-style: none"></img>
            </a></td>
            <td style="background-color:<%=mColorCode%>;" width=75><div align="left"><%=rs.getString("a.paymentmode") %></div></td>
            <td style="background-color:<%=mColorCode%>;" width=75><div align="left"><%=rs.getString("a.paymentvoucherno") %></div></td>
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=mPayment_date%></div></td>
            <td style="background-color:<%=mColorCode%>;" width="400"><div align="left"><%=rs.getString("b.companyname")%></div></td>
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=rs.getString("a.chorddorcreditnoteno")%></div></td>
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=mCheque_date%></div></td>
            <%
            double mamount=0.00;
            mamount =Double.parseDouble(rs.getString("a.amountpaid"));
            %> 
            <td style="background-color:<%=mColorCode%>;"><div align="right"><%=df2.format(mamount)%></div></td>
            
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=rs.getString("a.tallyrefno")%></div></td>
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=rs.getString("a.twempname")%></div></td>
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=mEntered_on%></div></td>
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=rs.getString("a.ded_type")%></div></td>
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=rs.getString("a.ded_amount")%></div></td>
            <td style="background-color:<%=mColorCode%>;"><div align="left"><%=rs.getString("a.remarks")%></div></td>
            </tr>
        <%
            }
        }
        catch (Exception e)
        {
        	e.printStackTrace();
        }
        %>
                <tr>
        <td>
          
          </td>
          </tr>
     </table>
     </div>
     </div>
     <br><br>
     
         <br>
	 <br><br><br><br><br><br>
	<div id='tooltipper' style="position:absolute; width:300;"></div>
	<div id="footer">
	<p><a href="http://www.myfleetview.com"> Copyright &copy; 2009
           	by Transworld Compressor Technologies Ltd. All Rights Reserved.</a></p>
	</div>
	</form>
	</body>
	<script>
	
	</script>
	
</html>



	
</jsp:useBean>