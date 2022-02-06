/**
 *  myMenu.js
 */

/*function myMenu1()
{
	
}

function myMenu2()
{
	
}*/


function myMenu(status)
{
	var menu = document.getElementById("menuTable");
	
	if (status == 1)
	{
		//확인
		//alert("1번확인");
		
		menu.style.display = "block";
	}
	else 
	{
		//확인
		//alert("2번확인");
		
		menu.style.display = "none";
	}
}


